# frozen_string_literal: true

class TaskComponent < ViewComponent::Base
  extend Forwardable

  def_delegators :@task, :status, :id, :name, :description, :persisted?, :project

  with_collection_parameter :task
  attr_reader :task

  def initialize(task:)
    @task = task
  end

  def render?
    persisted?
  end

  def task_id
    id
  end

end
