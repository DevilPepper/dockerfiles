#!/bin/sh

dotnet new -i NUnit3.DotNetNew.Template
dotnet new -i MonoGame.Template.CSharp

dotnet tool install --global dotnet-mgcb-editor
# mgcb-editor --register
