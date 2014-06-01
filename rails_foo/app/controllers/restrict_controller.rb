class RestrictController < ActionController::Base
  # every action actually is rack end potint.

  def self.call(env)
    action(:respond_foo).call(env)
  end

  def respond_foo
    render :text => "Couldn't access the resource"
  end

end
