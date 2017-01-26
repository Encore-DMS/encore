classdef DataStoreCoordinator < encore.core.CoreObject
    
    methods
        
        function obj = DataStoreCoordinator(cobj)
            obj@encore.core.CoreObject(cobj);
        end
        
        function c = getContext(obj)
            cctx = obj.tryCoreWithReturn(@()obj.cobj.getContext());
            c = encore.core.DataContext(cctx);
        end
        
        function s = getPrimaryDataStore(obj)
            cstr = obj.tryCoreWithReturn(@()obj.cobj.getPrimaryDataStore());
            s = encore.core.DataStore(cstr);
        end
        
    end
    
end

