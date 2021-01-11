class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    @job = Job.new({job_title: params[:job_title]})
    if @job.save
      render 'jobs/create'
    end
  end

  def show
    @job = Job.find(params[:id])
    if @job
      render 'jobs/show'
    end
  end

  def index
    @jobs = Job.all
    render 'jobs/index'
  end
end
