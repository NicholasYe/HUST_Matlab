%% ��ȡ��Ƶ����
% ��MATLAB��ѧ��ģ������ʵ����(��MATLAB����ѧ��ģ�е�Ӧ�á�������)�����������磬׿���䡢���������. 
videoFReader = vision.VideoFileReader('vippedtracking.mp4');

% ������Ƶ�ļ�
videoPlayer = vision.VideoPlayer;
while ~isDone(videoFReader)
clc
end
release(videoPlayer);

%% ���ò��ŷ�ʽ
% ���ò�����
reset(videoFReader)
% ���Ӳ������ĳߴ�
r = groot;
scrPos = r.ScreenSize;
%  Size/position is always a 4-element vector: [x0 y0 dx dy]
dx = scrPos(3); dy = scrPos(4);
videoPlayer = vision.VideoPlayer('Position',[dx/8, dy/8, dx*(3/4), dy*(3/4)]);
while ~isDone(videoFReader)
  videoFrame = step(videoFReader);
  step(videoPlayer, videoFrame);
end
release(videoPlayer);
reset(videoFReader)
