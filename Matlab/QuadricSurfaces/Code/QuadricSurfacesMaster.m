%{
    QuadricSurfacesMaster.m
    Version 2.4
    Generates plots of all quadric surface types.
    Written on 10/19/18
      _____                       _____              _     
     |  __ \                     |  __ \            (_)    
     | |__) |   _  __ _ _ __     | |  | | __ ___   ___ ___ 
     |  _  / | | |/ _` | '_ \    | |  | |/ _` \ \ / / / __|
     | | \ \ |_| | (_| | | | |   | |__| | (_| |\ V /| \__ \
     |_|  \_\__, |\__,_|_| |_|   |_____/ \__,_| \_/ |_|___/
             __/ |                                       
            |___/                                        
%}

% Generate Ellipsoid
NewQuadricPlot(1,1,1,0,0,0,0,0,0,-1, "Ellipsoid");
% Generate Cone
NewQuadricPlot(1,1,-1,0,0,0,0,0,0,0, "Cone");
% Generate Hyperboloid of One Sheet
NewQuadricPlot(1,1,-1,0,0,0,0,0,0,-1, "Hyperboloid of One Sheet");
% Generate Hyperboloid of Two Sheets
NewQuadricPlot(-1,-1,1,0,0,0,0,0,0,-1, "Hyperboloid of Two Sheets");
% Generate Elliptic Paraboloid
NewQuadricPlot(1,1,0,0,0,0,0,0,-1,0, "Elliptic Paraboloid");
% Generate Hyperbolic Paraboloid
NewQuadricPlot(1,-1,0,0,0,0,0,0,-1,0, "Hyperbolic Paraboloid");
% Generate Elliptic Cylinder
NewQuadricPlot(1,1,0,0,0,0,0,0,0,-1, "Elliptic Cylinder");
% Generate Hyperbolic Cylinder
NewQuadricPlot(1,-1,0,0,0,0,0,0,0,-1, "Hyperbolic Cylinder");
% Generate Parabolic Cylinder
NewQuadricPlot(1,0,0,0,0,0,0,-1,0,0, "Parabolic Cylinder");

function NewQuadricPlot = NewQuadricPlot(A,B,C,D,E,F,G,H,I,J,plotname)
     if exist('plotname','var')
         % plotname exists, title figure
         figure('Name',plotname,'NumberTitle','off')
     else
         % plotname does not exist, general figure with default title
         figure
     end
     % plug fucntion arguments into general equation
     fimplicit3(@(x,y,z) A.*x.^2 + B.*y.^2 + C.*z.^2 + D.*x.*y + E.*x.*z + F.*y.*z + G.*x + H.*y + I.*z + J);
     camlight
    if exist('plotname','var')
        % if plotname exists, set plot title
        title(plotname)
    end
    
    %{
        % ONLY USE IF EXPORTING IMAGE FILES
        path = sprintf('C:\\Users\\Ryan\\Desktop\\Multivariable Notebook\\Matlab\\QuadricSurfaces\\GeneratedFigures\\%s.png', plotname);
        export_fig(path, '-png', '-transparent', '-r500');
        close
    %}
end