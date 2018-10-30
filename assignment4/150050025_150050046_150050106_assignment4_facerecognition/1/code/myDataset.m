function [train_X, train_Y, test_X, test_Y] = myDataset(dataset_id)
	orl_dataset_path = '../../att_faces/';
	yale_dataset_path = '../../CroppedYale/';

	if strcmp(dataset_id, 'orl')
		folders = dir(orl_dataset_path);
		itr_max = 34;
		train_fitr_max = 8;

		N_tr = 6*32;
		N_te = 4*32;
		d = 112*92;
	end
	if strcmp(dataset_id, 'yale')
		folders = dir(yale_dataset_path);
		itr_max = 40;
		train_fitr_max = 42;

		N_tr = 40*38;
		N_te = 895;
		d = 192*168;
	end

	train_X = zeros([d, N_tr]);
	train_Y = zeros([N_tr, 1]);

	test_X = zeros([d, N_te]);
	test_Y = zeros([N_te, 1]);

	train_index = 1;
	test_index = 1;
	for itr = 3:itr_max
		files = dir(fullfile(folders(itr).folder, folders(itr).name));
		for fitr = 3:train_fitr_max
			file_name = fullfile(files(fitr).folder, files(fitr).name);
			img = imread(file_name);
			train_X(:, train_index) = img(:);
			train_Y(train_index) = itr - 2;
			train_index = train_index + 1;
		end
		for fitr = train_fitr_max+1:numel(files)
			file_name = fullfile(files(fitr).folder, files(fitr).name);
			img = imread(file_name);
			test_X(:, test_index) = img(:);
			test_Y(test_index) = itr - 2;

			test_index = test_index + 1;
		end
	end 
	% test_X = test_X(:, 1:test_index-1);
	% test_Y = test_Y(1:test_index-1, :);
end