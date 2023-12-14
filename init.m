% 1) Add all subfolders to path
base_path = fileparts(which(mfilename));
subdir_names = ["geocentric", "rotations", "vectors", "orbit_2d", "orbit_3d",...
                "determination", "ref_problems", "transfers", "cr3bp"];
for subdir = subdir_names
    path_to_add = genpath(fullfile(base_path, subdir));
    fprintf("Adding path: %s\n", path_to_add);
    addpath(path_to_add);
end


% 2) DONE, clean up
disp("INIT DONE")
clearvars