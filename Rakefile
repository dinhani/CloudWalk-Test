require 'rake/testtask'
require 'rubocop/rake_task'
require 'rufo'

# ------------------------------------------------------------------------------
# Execution
# ------------------------------------------------------------------------------
task :run do
    ruby '-I "lib" bin/app.rb'
end

# ------------------------------------------------------------------------------
# Test
# ------------------------------------------------------------------------------
Rake::TestTask.new do |t|
    t.libs = %w(lib spec)
    t.test_files = FileList['spec/**/*_spec.rb']
    t.verbose = true
end

# ------------------------------------------------------------------------------
# Linter
# ------------------------------------------------------------------------------
RuboCop::RakeTask.new(:lint) do |t|
    t.fail_on_error = false
    t.patterns = ["**/*.rb"]
    t.verbose = true
end

task :format do
    begin
        Rufo::Command.run(["bin", "lib", "spec"])
    rescue SystemExit
        # ignore exit
    end
    FileList["**/*.rb"].each do |filename|
        content = File.read(filename).delete("\r")
        File.open(filename, "wb") do |f|
            f.write(content)
        end
    end
end
