# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "bonsai-elasticsearch-rails"
  spec.version       = "0.2.0"

  spec.authors       = ["Rob Sears", "Nick Zadrozny"]
  spec.email         = ["rob@onemorecloud.com", "nick@onemorecloud.com"]

  spec.summary       = "Integrate your elasticsearch-rails gem with Bonsai Elasticsearch."
  spec.description   = <<-EOF
                          This gem offers a shim to connect Rails apps with a Bonsai
                          Elasticsearch cluster. The official Elasticsearch gem package
                          requires some minor configuration tweaks in order to work
                          correctly with Bonsai (namely the client needs to be instantiated
                          with the cluster location and HTTP authentication details), and
                          the process can be somewhat complicated for users who are
                          unfamiliar with the system.

                          The bonsai-elasticsearch-rails gem automatically sets up the
                          Elasticsearch client correctly so users don't need to worry about
                          configuring it in their code or writing an initializer.

                          In order for the gem to work correctly, the application needs an
                          environment variable called `BONSAI_URL`, which is populated with
                          the complete Bonsai Elaticsearch cluster URL, including the HTTP
                          authentication. The cluster URL will follow this pattern:

                          https://user1234:pass5678@cluster-slug-123.aws-region-X.bonsai.io/

                          On Heroku, this variable is created and populated automatically
                          when Bonsai is added to the application. Heroku users therefore do
                          not need to perform any additional configuration to connect to
                          their cluster after adding the bonsai-elasticsearch-rails gem.

                          Users who are self-hosting their Rails app will need to make sure
                          this environment variable is present:

                          export BONSAI_URL="https://user1234:pass5678@aws-region-X.bonsai.io/"

                          The cluster URL is available via the Bonsai dashboard.
                       EOF

  spec.homepage      = "https://github.com/omc/bonsai-elasticsearch-rails"
  spec.license       = "MIT"

  spec.files         = [ "lib/bonsai-elasticsearch-rails.rb", "lib/bonsai/elasticsearch/rails/railtie.rb" ]
  spec.require_paths = [ "lib" ]

  spec.add_runtime_dependency "elasticsearch-model", "> 0"
  spec.add_runtime_dependency "elasticsearch-rails", "> 0"

  spec.add_development_dependency "bundler", "~> 1"
  spec.add_development_dependency "rake", "< 11.0"

end
