# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "pandoc-markdown-jekyll-theme"
  spec.version       = "0.12.2"
  spec.authors       = ["Jake Zimmerman"]
  spec.email         = ["zimmerman.jake@gmail.com"]

  spec.summary       = %q{A Jekyll theme based on jez/pandoc-markdown-css-theme}
  spec.homepage      = "https://github.com/jez/pandoc-markdown-jekyll-theme"
  spec.license       = "BlueOak-1.0.0"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README|_template.html5)}i) }

  spec.add_runtime_dependency "jekyll-pandoc", "~> 2.0"

  spec.add_development_dependency "jekyll", "~> 3.3"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
