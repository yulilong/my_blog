# 概述（overview）

  由于manageiq是使用rails编写的，所以manageiq的源代码目录结构跟rails的目录结构是一样的，
开发语言是ruby，rails框架是mvc模式的，

### Dependencies Management Detecting Implement Details

<table>
  <tr>
    <th>Language</th>
    <th>DepsMgmt Program</th>
    <th>Dependencies file</th>
    <th>Default project servers</th>
    <th>Progress(%)</th>
  </tr>
  <tr>
    <td>Ruby</td>
    <td>bundler</td>
    <td>Gemfile(.lock)</td>
    <td>https://rubygems.org/</td>
    <!-- <td> https://rubygems.org/pages/data</td> -->
    <td>70</td>
  </tr>
  <tr>
    <td>Java</td>
    <td>Gradle, Maven</td>
    <td>build.gradle, pom.xml</td>
    <td>https://repo1.maven.org/maven2</td>
    <td>100</td>
  </tr>
  <tr>
    <td>NodeJS</td>
    <td>npm</td>
    <td>package.json</td>
    <td>http://registry.npmjs.org</td>
    <td>100</td>
  </tr>
  <tr>
      <td>Debian</td>
      <td>dpkg -l</td>
      <td></td>
      <td>https://launchpad.net/</td>
      <td>0</td>
  </tr>
  <tr>
    <td>Golang</td>
    <td>go list -json ./...</td>
    <td></td>
    <td></td>
    <td>50</td>
  </tr>
  <tr>
    <td>Python</td>
    <td>pip</td>
    <td>requirements.txt</td>
    <td>https://pypi.python.org/pypi</td>
    <td>0</td>
  </tr>  
  <tr>
    <td>Erlang</td>
    <td>rebar</td>
    <td>rebar.config</td>
    <td></td>
    <td>0</td>
  </tr>
  <tr>
      <td>BowerJS</td>
      <td>bower</td>
      <td>bower.json</td>
      <td></td>
      <td>50</td>
    </tr>
</table>

### test

<table>
  <thead>
    <tr>
      <th style="text-align: left">File/Folder</th>
      <th style="text-align: left">Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: left">app/</td>
      <td style="text-align: left">Contains the controllers, models, views, helpers, mailers and assets.</td>
    </tr>
    <tr>
      <td style="text-align: left">bin/</td>
      <td style="text-align: left">Contains the rails script that starts the app and can contain other scripts to setup, deploy or run the application.</td>
    </tr>
    <tr>
      <td style="text-align: left">certs/</td>
      <td style="text-align: left">Certificates needed by ManageIQ Appliance.</td>
    </tr>
    <tr>
      <td style="text-align: left">config/</td>
      <td style="text-align: left">Configuration of the ManageIQ application’s routes, database and more.</td>
    </tr>
    <tr>
      <td style="text-align: left">config.ru</td>
      <td style="text-align: left">Rack configuration for Rack based servers used to start the application.</td>
    </tr>
    <tr>
      <td style="text-align: left">db/</td>
      <td style="text-align: left">Contains the current database schema, as well as the database migrations.</td>
    </tr>
    <tr>
      <td style="text-align: left"><a href="#gems">gems/</a></td>
      <td style="text-align: left">Libraries planned for extraction to standalone gems.</td>
    </tr>
    <tr>
      <td style="text-align: left">Gemfile</td>
      <td style="text-align: left">Specification of the ManageIQ application’s gem dependencies. These files are used by the Bundler gem. For more information about Bundler, see the <a href="http://bundler.io">Bundler website</a>.</td>
    </tr>
    <tr>
      <td style="text-align: left"><a href="#lib">lib/</a></td>
      <td style="text-align: left">Extended modules for the ManageIQ application.</td>
    </tr>
    <tr>
      <td style="text-align: left">log/</td>
      <td style="text-align: left">ManageIQ application log files.</td>
    </tr>
    <tr>
      <td style="text-align: left">public/</td>
      <td style="text-align: left">The only folder seen by the world as-is. Contains static files and compiled assets.</td>
    </tr>
    <tr>
      <td style="text-align: left">Rakefile</td>
      <td style="text-align: left">This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the lib/tasks directory of your application.</td>
    </tr>
    <tr>
      <td style="text-align: left">README.md</td>
      <td style="text-align: left">Overview of the ManageIQ project.</td>
    </tr>
    <tr>
      <td style="text-align: left"><a href="#spec">spec/</a></td>
      <td style="text-align: left">Tests using RSpec.</td>
    </tr>
    <tr>
      <td style="text-align: left"><a href="#tools">tools/</a></td>
      <td style="text-align: left">Special purpose Ruby scripts that should not be executed without full understanding of what they do.</td>
    </tr>
    <tr>
      <td style="text-align: left">tmp/</td>
      <td style="text-align: left">Temporary files (like cache, pid, and session files).</td>
    </tr>
    <tr>
      <td style="text-align: left">vendor/</td>
      <td style="text-align: left">A place for all third-party code.</td>
    </tr>
  </tbody>
</table>