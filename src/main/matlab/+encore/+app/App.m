classdef App < handle

    methods (Static)

        function n = name()
            n = 'Encore';
        end

        function d = description()
            d = 'Data Management System';
        end

        function v = version()
            v = '1.0.0.0'; % i.e. 1.0-a
        end

        function o = owner()
            o = 'Encore-DMS';
        end

        function r = repo()
            r = 'encore-matlab';
        end

    end

end
