require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  render_views

  describe 'POST /jobs' do
    it 'renders newly created job in JSON' do
      post :create

      expect(Job.count).to eq(1)
    end
  end

  describe 'GET /jobs/:id' do
    it 'renders specified job' do
      job_1 = Job.create(job_title: 'Job #1')

      get :show, params: {id: job_1.id}

      expect(response.body).to eq({
        job: {
          id: job_1.id,
          url: job_1.url,
          employer_name: job_1.employer_name,
          employer_description: job_1.employer_description,
          job_title: job_1.job_title,
          job_description: job_1.job_description,
          years_of_experience: job_1.years_of_experience,
          educational_requirement: job_1.educational_requirement,
          industry: job_1.industry,
          base_salary: job_1.base_salary,
          employment_type_id: job_1.employment_type_id,
        }
      }.to_json)
    end
  end

  describe 'GET /jobs' do
    it 'renders all jobs in JSON' do
      job_1 = Job.create(job_title: 'Job #1')
      job_2 = Job.create(job_title: 'Job #2', industry: 'Jobs')

      get :index

      expected_response = {
        jobs: [
          {
            id: job_1.id,
            url: job_1.url,
            employer_name: job_1.employer_name,
            employer_description: job_1.employer_description,
            job_title: job_1.job_title,
            job_description: job_1.job_description,
            years_of_experience: job_1.years_of_experience,
            educational_requirement: job_1.educational_requirement,
            industry: job_1.industry,
            base_salary: job_1.base_salary,
            employment_type_id: job_1.employment_type_id,
          }, {
            id: job_2.id,
            url: job_2.url,
            employer_name: job_2.employer_name,
            employer_description: job_2.employer_description,
            job_title: job_2.job_title,
            job_description: job_2.job_description,
            years_of_experience: job_2.years_of_experience,
            educational_requirement: job_2.educational_requirement,
            industry: job_2.industry,
            base_salary: job_2.base_salary,
            employment_type_id: job_2.employment_type_id,
          }
        ]
      }

      expect(response.body).to eq(expected_response.to_json)
    end
  end



end
