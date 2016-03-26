shared_examples "show_flash_message" do |type, now|
  it do
    if now
      should set_flash.now[type]
    else
      should set_flash[type]
    end
  end
end

shared_examples "render_page" do |page|
  it { should render_template page }
end

shared_examples "redirect_to" do |path|
  it { should redirect_to path }
end
