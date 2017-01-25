classdef Encore < encore.core.CoreObject
    
    methods (Static)
        
        function c = connect(host, username, password)
            try
                cdsc = io.github.encore_dms.Encore.connect(host, username, password);
            catch x
                if isa(x, 'matlab.exception.JavaException')
                    error(encore.core.util.javaReport(x));
                else
                    rethrow(x);
                end
            end
            c = encore.core.DataStoreCoordinator(cdsc);
        end
        
    end
    
end

