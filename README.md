CKEditor Forms control plugin for Alfresco Share
====================================

Author: Peter Lšfgren, Loftux AB, http://loftux.se

This add-on lets you use the CKEditor, http://ckeditor.com as your wysiwyg
editor when editing html files in Alfresco Share

Installation
------------

The dashlet has been developed to install on top of an existing Alfresco
3.4 installation.

An Ant build script is provided to build a JAR file containing the 
custom files, which can then be installed into the 'tomcat/shared/lib' folder 
of your Alfresco installation.

To build the JAR file, run the following command from the base project 
directory.

    ant clean dist-jar

The command should build a JAR file named ckeditor-form-control.jar
in the 'dist' directory within your project.

To deploy the dashlet files into a local Tomcat instance for testing, you can 
use the hotcopy-tomcat-jar task. You will need to set the tomcat.home
property in Ant.

    ant -Dtomcat.home=C:/Alfresco/tomcat clean hotcopy-tomcat-jar
    
Once you have run this you will need to restart Tomcat so that the classpath 
resources in the JAR file are picked up.

Using the CKEditor control
--------------------------

Copy the ckeditor-form-control.jar to tomcat lib directory.

Update your share form configuration files so that whenever cm:content is used
<appearance>
   <field id="cm:content">
      <control template="/org/alfresco/components/form/controls/ckeditor.ftl">
         <control-param name="forceEditor">true</control-param>
      </control>
   </field>
</appearance>

There is a sample config file based on alfresco share default 3.4 config. You
can place this file in tomcat/shared/classes/alfresco/web-extension to try
out the features.

Custom config
-------------
To load a custom config file, add to control config
<control-param name="settingsfile">components/editors/ckeditor/my-config.js</control-param>
where the path is to your custom config file. The default config is found in the jar as
components/editors/ckeditor/config.js.

Features
--------
- All the standard CKEditor features, see http://ckeditor.com
- Built in browser for images stored in Share sites, including thumbnail and
large preview
- Custom config files can be loaded