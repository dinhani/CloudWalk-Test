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
RuboCop::RakeTask.new(:lint)

task :format do
    begin
        Rufo::Command.run(["."])
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

task :wat do
    puts
    File.write("wat.txt", "wat\nwut")
end