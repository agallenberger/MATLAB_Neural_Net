%% train_net_main.m
%MAT 128b Project 2 - Part 4, 5, 6
%Driver file for train_net.m
clear; clc; close all;
load mnistdata;

%% Initialize neural net parameters
layers = 1;              %number of hidden layers [1,inf)
neurons_hidden = 10;      %number of neurons per hidden layer
trainingRate = .05;       %within the interval [0.1, 0.01]

%Things you can't change
neurons_input = 784;     %number of neurons in the input layer
neurons_output = 10;     %number of neurons in the output layer

%% Train the neural net using train_net.m
W{1} = rand(neurons_input, neurons_hidden); %INPUT -> HIDDEN
for i = 1:layers-1
    W{i+1} = rand(neurons_hidden, neurons_hidden); %HIDDEN -> HIDDEN
end
W{end+1} = rand(neurons_hidden, neurons_output); %HIDDEN -> OUTPUT

% for i = 1:2000
%     
%     digit = floor(rand()*10);
%     k = ceil(rand()*3000);
%     
%     INPUT = double(logical(getMNIST(digit, 1)));
%     W = train_net(INPUT(k,:), W, layers, neurons_output, trainingRate, digit);
% 
%     if mod(i,100) == 0
%         disp([ num2str(i/100) '/20'])
%     end
% end

train{1} = train1;
train{2} = train2;
train{3} = train3;
train{4} = train4;
train{5} = train5;
train{6} = train6;
train{7} = train7;
train{8} = train8;
train{9} = train9;
train{10} = train0;

for k = 1:10
    INPUT = zeros(5000,784);
    digits = [0 1 2 3 4 5 6 7 8 9];
    digits = repmat(digits,1,500);
    for i = 1:5000
        INPUT(i,:) = train{digits(i)+1}(i,:);
    end

    W = train_net(INPUT, digits, W, layers, trainingRate);
end

%% Save weight matrices in .mat files
filename = 'W_master.mat';
save(filename, 'W')

disp('--------------- TRAINING COMPLETE ---------------')
disp('Neural Net Parameters:')
disp(['  - Number of HIDDEN layers =            ' num2str(layers)])
disp(['  - Number of INPUT neurons =            ' num2str(neurons_input)])
disp(['  - Number of HIDDEN neurons/layer =     ' num2str(neurons_hidden)])
disp(['  - Number of OUTPUT neurons =           ' num2str(neurons_output)])
disp(['  - Weight data written to:              ' filename])