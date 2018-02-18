RSpec.describe Molt do

  it "has a version number" do
    expect(Molt::VERSION).not_to be nil
  end

  after(:example) do
    FileUtils.rm_rf "/tmp/SomeModule" if Dir.exist? "/tmp/SomeModule"
    FileUtils.rm_rf "./.molt" if Dir.exist? "./.molt"
  end

  it "Generates folders and files" do
    system "bundle exec molt setup"
    system "bundle exec molt setup_project"
    system "bundle exec bin/molt create_module SomeModule viper_table --output-folder /tmp -f"
    expect(Dir.exist? "./.molt").to eq(true)
    expect(Dir.exist? "/tmp/SomeModule").to eq(true)
    expect(Dir.exist? "/tmp/SomeModule/DataManagers").to eq(true)
    expect(File.exist? "/tmp/SomeModule/DataManagers/SomeModuleRemoteDataManager.swift").to eq(true)
    expect(File.exist? "/tmp/SomeModule/DataManagers/SomeModuleLocalDataManager.swift").to eq(true)
    expect(File.exist? "/tmp/SomeModule/SomeModuleInteractor.swift").to eq(true)
    expect(File.exist? "/tmp/SomeModule/SomeModuleProtocols.swift").to eq(true)
    expect(File.exist? "/tmp/SomeModule/SomeModuleWireFrame.swift").to eq(true)
    expect(File.exist? "/tmp/SomeModule/SomeModulePresenter.swift").to eq(true)
    expect(File.exist? "/tmp/SomeModule/SomeModuleView.swift").to eq(true)
  end
end
