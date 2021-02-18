# frozen_string_literal: true

class ProjectOverviewComponent < ViewComponent::Base
  extend Forwardable

  delegate [:name, :description, :status, :percent_completed, :total_complete, :total_tasks] => :@project

  with_collection_parameter :project
  attr_reader :project


  def initialize(project:)
    @project = project
  end

  def task_data 
    "#{percentage_completed} #{overview}"
  end

  private 

  def percentage_completed
    "#{percent_completed}% completed"
  end

  def overview
    "(#{total_complete} / #{total_tasks}) tasks"
  end
end


