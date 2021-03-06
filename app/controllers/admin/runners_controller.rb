class Admin::RunnersController < Admin::ApplicationController
  before_filter :authenticate_user!
  before_filter :runner, except: :index

  def index
    @runners = Runner.page(params[:page]).per(30)
  end

  def show
    @builds = @runner.builds.order('id DESC').first(30)
  end

  def update
    @runner.update_attributes(description: params[:runner][:description])

    respond_to do |format|
      format.js
      format.html { redirect_to admin_runners_path }
    end
  end

  def destroy
    binding.pry
    @runner.destroy

    redirect_to admin_runners_path
  end

  def assign_all
    Project.all.each { |project| @runner.assign_to(project, current_user) }

    respond_to do |format|
      format.js
      format.html { redirect_to admin_runners_path, notice: "Runner was assigned to all projects" }
    end
  end

  private

  def runner
    @runner ||= Runner.find(params[:id])
  end
end
