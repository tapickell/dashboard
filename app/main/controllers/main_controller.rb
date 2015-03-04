class MainController < Volt::ModelController
  def index
    #enqueue obdworker every .50 || .25 seconds
    #while true
      #page._pid.assign_attributes ObdWorker.perform
      #sleep(0.5)
    #end
    page._pid.assign_attribute(:engine_rpm, "3700rpm")
    page._pid.assign_attribute(:vehicle_speed, "98mph")
  end

  def about
  end

  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
