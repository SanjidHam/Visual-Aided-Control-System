%% This class puts simulated objects into matlab environment
% This class is largely inspired by and based on Gavin's post on
% Mathsworks regarding Putting Simulated Objects into The Environment
% https://au.mathworks.com/matlabcentral/fileexchange/58774-putting-simulated-objects-into-the-environment

classdef PutObject
    properties
        % Directory of .ply file (must include folder if the file is in
        % folder)
        filename = [];
    end
    
    properties (SetAccess = private)
        objectPose;
        objectMesh_h;
        objectVerts;
        objectVertexCount;
    end
    
    methods
        %% Constructor that accepts filename and reads .ply file in the directory
        function self = PutObject(object)
            % Call the function by parsing in the name of .ply file and specifying Pose
            self.filename = object;
            [f,v,data] = plyread(self.filename,'tri'); %triangle mesh
            self.objectVertexCount = size(v,1);
            midPoint = sum(v)/self.objectVertexCount;
            self.objectVerts = v - repmat(midPoint,self.objectVertexCount,1);
            self.objectPose = eye(4); % create the matrix 4x4 for partpose 
            vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
            self.objectMesh_h =  trisurf(f,self.objectVerts(:,1),self.objectVerts(:,2), self.objectVerts(:,3) ...
                ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
            %camlight;
        end
        
        %% Function to move the object
        function move(self, pose)
            forwardTR = makehgtform('translate',pose);
            self.objectPose = self.objectPose*forwardTR; %update the location
            updatedPoints = [self.objectPose * [self.objectVerts,ones(self.objectVertexCount,1)]']';  %update the location
            self.objectMesh_h.Vertices = updatedPoints(:,1:3);
        end
    end
end