# frozen_string_literal: true

class ProjectOverviewComponent < ViewComponent::Base
  with_collection_parameter :project
  attr_reader :project


  def initialize(project:)
    @project = project
  end

  def task_data 
    "#{percentage_completed} #{overview}"
  end

  def name
    project.name
  end

  def description
    project.description
  end

  def status
    project.status
  end

  private 

  def percentage_completed
    "#{project.percent_completed}% completed"
  end

  def overview
    "(#{project.total_complete} / #{project.total_tasks}) tasks"
  end
end


