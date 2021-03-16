require 'rails_helper'

RSpec.describe "stub.html.erb", type: :view do
  before do
    stub_template "stub.html.erb" => "STUB"
  end

  it "renders stub successfully" do
    render
  end

  it "clears view cache" do
    # Simulate test which triggers ActionView::CacheExpiry::Executor#clear_cache
    # e.g.
    #   Delayed::Worker.delay_jobs = false
    #   SomeDelayedJob.perform_later
    ActionView::LookupContext::DetailsKey.clear
  end

  it "renders stub again" do
    render
  end
end
