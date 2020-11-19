class Swagger::Docs::Config
  def self.transform_path(path, api_version)
    # Make a distinction between the APIs and API documentation paths.
    "public/api/v1"
  end
end

Swagger::Docs::Config.register_apis({
  '1.0' => {
    controller_base_path: '',
    api_file_path: 'public/api/v1',
    # base_path: 'http://localhost:3000',
    clean_directory: true,
    :parent_controller => Api::V1::BaseController,
    # add custom attributes to api-docs
    :attributes => {
      :info => {
        "title" => "Swagger Sample App",
        "description" => "This is a sample description.",
        "termsOfServiceUrl" => "http://helloreverb.com/terms/",
        "contact" => "apiteam@wordnik.com",
        "license" => "Apache 2.0",
        "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
      }
    }
  }
})
