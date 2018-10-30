function [train_X, test_X, rem_X] = myDataset()
	orl_dataset_path = '../../att_faces/';
    folders = dir(orl_dataset_path);
    itr_max = 34;
    train_fitr_max = 8;

    N_tr = 6*32;
    N_te = 4*32;
    N_re = 10*8;
    d = 112*92;
	train_X = zeros([d, N_tr]);
    rem_X   = zeros([d, N_re]);
	test_X  = zeros([d, N_te]);

	train_index = 1;
	test_index = 1;
	for itr = 3:itr_max
		files = dir(fullfile(folders(itr).folder, folders(itr).name));
		for fitr = 3:train_fitr_max
			file_name = fullfile(files(fitr).folder, files(fitr).name);
			img = imread(file_name);
			train_X(:, train_index) = img(:);
			train_index = train_index + 1;
		end
		for fitr = train_fitr_max+1:numel(files)
			file_name = fullfile(files(fitr).folder, files(fitr).name);
			img = imread(file_name);
			test_X(:, test_index) = img(:);
			test_index = test_index + 1;
		end
    end 
    
    rem_index = 1;
    for itr = itr_max+1:numel(folders)
        files = dir(fullfile(folders(itr).folder, folders(itr).name));
		for fitr = 3:numel(files)
			file_name = fullfile(files(fitr).folder, files(fitr).name);
			img = imread(file_name);
			rem_X(:, rem_index) = img(:); 
			rem_index = rem_index + 1;
        end
    end
end