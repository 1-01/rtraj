function y = convertxUnits(x, units, newUnits)
% 
% Matt Werner (m.werner@vt.edu) - Dec 9, 2020
% 
% Convert the quantities contained in x, which hold the indicated units, to
% the the indicated desired units. The unit conversions are assumed to
% happen column-wise (i.e. in the "1" direction) for standard 2D matrices x.
% 
%    Inputs:
% 
%                 x - Quantity holding values of particular units that are
%                     desired to be changed. The units of x are changed in
%                     each column, i.e. column-wise.
%                     Size: n-by-m (scalar)
%                     Units: ?
% 
%             units - Specified units of each column in x.
%                     Size: 1-by-m (string)
%                     Units: - (N/A)
% 
%          newUnits - Specified units of each column in x that the provided
%                     values in x shall be converted to.
%                     Size: 1-by-m (string)
%                     Units: - (N/A)
% 

% Check that inputs are strings
checkInput(units, newUnits)

% Leave if inputs are valid to Matlab (output unassigned)

% Check that sizes are compatible
sizex = size(x);
if (sizex(2) ~= size(units, 2) || sizex(2) ~= size(newUnits, 2))
    error("Incompatibile sizes of quantities and units.")
end

% Allocate space to hold unit conversions
unitmult = nan(1, size(x, 2));

% Determine which unit conversions go where in `unitmult'
for ii = 1:sizex(2)
    % Lowercase inputs
    currentUnit = lower(units(ii));
    desiredUnit = lower(newUnits(ii));
    
    %% Time
    switch currentUnit
        case {"millisecond", "milliseconds", "ms"}
            switch desiredUnit
                case {"millisecond", "milliseconds", "ms"}
                    unitmult(ii) = 1;
                case {"second", "seconds", "s"}
                    unitmult(ii) = 0.001;
                case {"minute", "minutes", "min"}
                    unitmult(ii) = 1.6667e-5;
                case {"hour", "hours", "hr"}
                    unitmult(ii) = 2.77783333e-7;
                case {"day", "days", "dy"}
                    unitmult(ii) = 1.1574305541667e-8;
                case {"week", "weeks", "wk"}
                    unitmult(ii) = 1.653472220238142861e-9;
            end
        case {"second", "seconds", "s"}
            switch desiredUnit
                case {"millisecond", "milliseconds", "ms"}
                    unitmult(ii) = 1000;
                case {"second", "seconds", "s"}
                    unitmult(ii) = 1;
                case {"minute", "minutes", "min"}
                    unitmult(ii) = 1/60;
                case {"hour", "hours", "hr"}
                    unitmult(ii) = 1/3600;
                case {"day", "days", "dy"}
                    unitmult(ii) = 1/86400;
                case {"week", "weeks", "wk"}
                    unitmult(ii) = 1/604800;
            end
        case {"minute", "minutes", "min"}
            switch desiredUnit
                case {"millisecond", "milliseconds", "ms"}
                    unitmult(ii) = 60000;
                case {"second", "seconds", "s"}
                    unitmult(ii) = 60;
                case {"minute", "minutes", "min"}
                    unitmult(ii) = 1;
                case {"hour", "hours", "hr"}
                    unitmult(ii) = 1/60;
                case {"day", "days", "dy"}
                    unitmult(ii) = 1/1440;
                case {"week", "weeks", "wk"}
                    unitmult(ii) = 1/10080;
            end
        case {"hour", "hours", "hr"}
            switch desiredUnit
                case {"millisecond", "milliseconds", "ms"}
                    unitmult(ii) = 3600000;
                case {"second", "seconds", "s"}
                    unitmult(ii) = 3600;
                case {"minute", "minutes", "min"}
                    unitmult(ii) = 60;
                case {"hour", "hours", "hr"}
                    unitmult(ii) = 1;
                case {"day", "days", "dy"}
                    unitmult(ii) = 1/24;
                case {"week", "weeks", "wk"}
                    unitmult(ii) = 1/168;
            end
        case {"day", "days", "dy"}
            switch desiredUnit
                case {"millisecond", "milliseconds", "ms"}
                    unitmult(ii) = 86400000;
                case {"second", "seconds", "s"}
                    unitmult(ii) = 86400;
                case {"minute", "minutes", "min"}
                    unitmult(ii) = 1440;
                case {"hour", "hours", "hr"}
                    unitmult(ii) = 24;
                case {"day", "days", "dy"}
                    unitmult(ii) = 1;
                case {"week", "weeks", "wk"}
                    unitmult(ii) = 1/7;
            end
        case {"week", "weeks", "wk"}
            switch desiredUnit
                case {"millisecond", "milliseconds", "ms"}
                    unitmult(ii) = 604800000;
                case {"second", "seconds", "s"}
                    unitmult(ii) = 604800;
                case {"minute", "minutes", "min"}
                    unitmult(ii) = 10080;
                case {"hour", "hours", "hr"}
                    unitmult(ii) = 168;
                case {"day", "days", "dy"}
                    unitmult(ii) = 7;
                case {"week", "weeks", "wk"}
                    unitmult(ii) = 1;
            end
    end
                    
    
    %% Distance
    switch currentUnit
        case {"millimeter", "millimeters", "mm"}
            switch desiredUnit
                case {"millimeter", "millimeters", "mm"}
                    unitmult(ii) = 1;
                case {"centimeter", "centimeters", "cm"}
                    unitmult(ii) = 0.1;
                case {"meter", "meters", "m"}
                    unitmult(ii) = 0.001;
                case {"kilometer", "kilometers", "km"}
                    unitmult(ii) = 0.000001;
                case {"inch", "inches", "in"}
                    unitmult(ii) = 0.0394;
                case {"foot", "feet", "ft"}
                    unitmult(ii) = 0.0033;
                case {"mile", "miles", "mi"}
                    unitmult(ii) = 6.2137e-7;
                case {"nautical mile", "nautical miles", "nmi"}
                    unitmult(ii) = 5.3996e-7;
            end
        case {"centimeter", "centimeters", "cm"}
            switch desiredUnit
                case {"millimeter", "millimeters", "mm"}
                    unitmult(ii) = 10;
                case {"centimeter", "centimeters", "cm"}
                    unitmult(ii) = 1;
                case {"meter", "meters", "m"}
                    unitmult(ii) = 0.01;
                case {"kilometer", "kilometers", "km"}
                    unitmult(ii) = 0.00001;
                case {"inch", "inches", "in"}
                    unitmult(ii) = 0.394;
                case {"foot", "feet", "ft"}
                    unitmult(ii) = 0.033;
                case {"mile", "miles", "mi"}
                    unitmult(ii) = 6.2137e-6;
                case {"nautical mile", "nautical miles", "nmi"}
                    unitmult(ii) = 5.3996e-6;
            end
        case {"meter", "meters", "m"}
            switch desiredUnit
                case {"millimeter", "millimeters", "mm"}
                    unitmult(ii) = 1000;
                case {"centimeter", "centimeters", "cm"}
                    unitmult(ii) = 100;
                case {"meter", "meters", "m"}
                    unitmult(ii) = 1;
                case {"kilometer", "kilometers", "km"}
                    unitmult(ii) = 0.001;
                case {"inch", "inches", "in"}
                    unitmult(ii) = 39.3701;
                case {"foot", "feet", "ft"}
                    unitmult(ii) = 3.28084;
                case {"mile", "miles", "mi"}
                    unitmult(ii) = 0.000621371;
                case {"nautical mile", "nautical miles", "nmi"}
                    unitmult(ii) = 0.000539957;
            end
        case {"kilometer", "kilometers", "km"}
            switch desiredUnits
                case {"millimeter", "millimeters", "mm"}
                    unitmult(ii) = 1000000;
                case {"centimeter", "centimeters", "cm"}
                    unitmult(ii) = 100000;
                case {"meter", "meters", "m"}
                    unitmult(ii) = 1000;
                case {"kilometer", "kilometers", "km"}
                    unitmult(ii) = 1;
                case {"inch", "inches", "in"}
                    unitmult(ii) = 39370.1;
                case {"foot", "feet", "ft"}
                    unitmult(ii) = 3280.84;
                case {"mile", "miles", "mi"}
                    unitmult(ii) = 0.621371;
                case {"nautical mile", "nautical miles", "nmi"}
                    unitmult(ii) = 0.539957;
            end
        case {"inch", "inches", "in"}
            switch desiredUnits
                case {"millimeter", "millimeters", "mm"}
                    unitmult(ii) = 25.4;
                case {"centimeter", "centimeters", "cm"}
                    unitmult(ii) = 2.54;
                case {"meter", "meters", "m"}
                    unitmult(ii) = 0.0254;
                case {"kilometer", "kilometers", "km"}
                    unitmult(ii) = 2.54e-5;
                case {"inch", "inches", "in"}
                    unitmult(ii) = 1;
                case {"foot", "feet", "ft"}
                    unitmult(ii) = 0.0833333;
                case {"mile", "miles", "mi"}
                    unitmult(ii) = 1.5783e-5;
                case {"nautical mile", "nautical miles", "nmi"}
                    unitmult(ii) = 1.3715e-5;
            end
        case {"foot", "feet", "ft"}
            switch desiredUnits
                case {"millimeter", "millimeters", "mm"}
                    unitmult(ii) = 304.8;
                case {"centimeter", "centimeters", "cm"}
                    unitmult(ii) = 30.48;
                case {"meter", "meters", "m"}
                    unitmult(ii) = 0.3048;
                case {"kilometer", "kilometers", "km"}
                    unitmult(ii) = 0.0003048;
                case {"inch", "inches", "in"}
                    unitmult(ii) = 12;
                case {"foot", "feet", "ft"}
                    unitmult(ii) = 1;
                case {"mile", "miles", "mi"}
                    unitmult(ii) = 0.000189394;
                case {"nautical mile", "nautical miles", "nmi"}
                    unitmult(ii) = 0.000164579;
            end
        case {"mile", "miles", "mi"}
            switch desiredUnits
                case {"millimeter", "millimeters", "mm"}
                    unitmult(ii) = 160934000;
                case {"centimeter", "centimeters", "cm"}
                    unitmult(ii) = 160934;
                case {"meter", "meters", "m"}
                    unitmult(ii) = 1609.34;
                case {"kilometer", "kilometers", "km"}
                    unitmult(ii) = 1.60934;
                case {"inch", "inches", "in"}
                    unitmult(ii) = 63360;
                case {"foot", "feet", "ft"}
                    unitmult(ii) = 5280;
                case {"mile", "miles", "mi"}
                    unitmult(ii) = 1;
                case {"nautical mile", "nautical miles", "nmi"}
                    unitmult(ii) = 0.868976;
            end
        case {"nautical mile", "nautical miles", "nmi"}
            switch desiredUnits
                case {"millimeter", "millimeters", "mm"}
                    unitmult(ii) = 1852000;
                case {"centimeter", "centimeters", "cm"}
                    unitmult(ii) = 185200;
                case {"meter", "meters", "m"}
                    unitmult(ii) = 1852;
                case {"kilometer", "kilometers", "km"}
                    unitmult(ii) = 1.852;
                case {"inch", "inches", "in"}
                    unitmult(ii) = 72913.4;
                case {"foot", "feet", "ft"}
                    unitmult(ii) = 6076.12;
                case {"mile", "miles", "mi"}
                    unitmult(ii) = 1.15078;
                case {"nautical mile", "nautical miles", "nmi"}
                    unitmult(ii) = 1;
            end
    end
    
    %% Speed
    
    %% Mass
    switch currentUnit
        case {"pound mass", "pounds mass", "lbm", "lb"}
            switch desiredUnit
                case {"kilogram", "kilograms", "kg"}
                    unitmult(ii) = 0.453592;
                case {"pound mass", "pounds mass", "lbm"}
                    unitmult(ii) = 1;
            end
        case {"kilogram", "kilograms", "kg"}
            switch desiredUnit
                case {"kilogram", "kilograms", "kg"}
                    unitmult(ii) = 1;
                case {"pound mass", "pounds mass", "lbm", "lb"}
                    unitmult(ii) = 2.20462;
            end
    end
    
    %% Mass Flow
    switch currentUnit
        case {"pound per second", "pounds per second", "lbps", "lb/s"}
            switch desiredUnit
                case {"kilogram per second", "kilogram per second", "kgps", "kg/s"}
                    unitmult(ii) = 0.453592;
                case {"pound per second", "pounds per second", "lbps", "lb/s"}
                    unitmult(ii) = 1;
            end
        case {"kilogram per second", "kilogram per second", "kgps", "kg/s"}
            switch desiredUnit
                case {"kilogram per second", "kilogram per second", "kgps", "kg/s"}
                    unitmult(ii) = 1;
                case {"pound per second", "pounds per second", "lbps", "lb/s"}
                    unitmult(ii) = 2.20462;
            end
    end
    
    %% Force
    switch currentUnit
        case {"newton", "newtons", "n"}
            switch desiredUnit
                case {"newton", "newtons", "n"}
                    unitmult(ii) = 1;
                case {"pound", "pounds", "lb", "lbf"}
                    unitmult(ii) = 0.224809;
            end
        case {"pound", "pounds", "lb", "lbf"}
            switch desiredUnit
                case {"newton", "newtons", "n"}
                    unitmult(ii) = 4.44822;
                case {"pound", "pounds", "lb", "lbf"}
                    unitmult(ii) = 1;
            end
    end                
                    
    %% Energy
    
end

% Convert units
y = x.*unitmult;