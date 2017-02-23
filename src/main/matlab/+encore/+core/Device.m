classdef Device < encore.core.AnnotatableEntity
    
    properties (SetAccess = private)
        experiment
        name
        manufacturer
    end
    
    methods
        
        function obj = Device(cobj)
            obj@encore.core.AnnotatableEntity(cobj);
        end
        
        function e = get.experiment(obj)
            e = encore.core.Experiment(obj.cobj.getExperiment());
        end
        
        function l = get.name(obj)
            l = char(obj.cobj.getName());
        end
        
        function l = get.manufacturer(obj)
            l = char(obj.cobj.getManufacturer());
        end
        
    end
    
end

