# Cookbook Name: pris
# Provider: scriptstep
#
# Copyright (c) 2015 ConvergeOne Holdings Corp.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

def whyrun_supported?
    true
end

use_inline_resources

action :create do
  if @current_resource.exists
    Chef::Log.info "#{@new_resource} already exists - checking for changes."
    updated = update_script_file
    if updated
      converge_by("Update #{ @new_resource }") do
        new_resource.updated_by_last_action(true)
      end
    else
      new_resource.updated_by_last_action(false)
    end
  else
    Chef::Log.info "#{@new_resource} does not exist - creating."
    converge_by("Create #{ @new_resource}") do
      add_scriptstep
      new_resource.updated_by_last_action(true)
    end
  end
end

action :delete do
  if @current_resource.exists
    Chef::Log.info "#{@new_resource} exists - deleting."
    converge_by("Delete #{ @new_resource}") do
      delete_scriptstep
      new_resource.updated_by_last_action(true)
    end
  else
    Chef::Log.info "#{@new_resource} does not exist - nothing to do."
  end
end

action :create_if_missing do
  if @current_resource.exists
    Chef::Log.info "#{@new_resource} already exists - nothing to do."
  else
    converge_by("Create #{ @new_resource}") do
      add_scriptstep
      new_resource.updated_by_last_action(true)
    end
  end
end

def pris
  Opennms::Pris.new(node)
end

def load_current_resource
  @current_resource = Chef::Resource::PrisScriptstep.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  @current_resource.requisition_name(@new_resource.requisition_name)

  if pris.requisition_exists?(@current_resource.requisition_name)
    @current_resource.requisition_exists = true
    if pris.scriptstep_exists?(@current_resource.name, @current_resource.requisition_name)
      @current_resource.exists = true
    end
  end
end

private

def add_source
  pris.add_requisition_scriptstep(new_resource.name, new_resource.requisition_name)
end

def delete_source
  pris.delete_requisition_scriptstep(new_resource.name, new_resource.requisition_name)
end

def update_script_file
  f = cookbook_file script_file_path(new_resource.name) do
    action :create
    source new_resource.name
    owner 'root'
    group 'root'
    mode 00644
  end
  f.updated_by_last_action?
end