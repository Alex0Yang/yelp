shared_examples "show_flash_message" do |type|
  it "show flash message" do
    expect(flash[type]).not_to be_blank
  end
end

shared_examples "render_page" do |page|
  it "render #{page} page" do
    expect(response).to render_template page
  end
end

shared_examples "redirect_to" do |path|
  it "redirect to #{path} page" do
    expect(response).to redirect_to path
  end
end
