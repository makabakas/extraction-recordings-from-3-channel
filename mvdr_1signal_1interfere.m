clear all; 
close all;
clc
M=3; % Size of Rx Matrix 
d=0.25;


K=0:M-1;
signal=10*pi/180; %�źŵ�����Ƕ�
v=exp(-j*K'*pi*sin(signal)) ; %��������,�ź�Դ������������Ԫ����������   20*1
IR=-10/180*pi;    %�����ź����䷽��
I=exp(-j*K'*pi*sin(IR)) ; %�����ź���������

theta=-90:1:90;%ULA���ƽǶȱ仯�ķ�Χ��Ƶ��ѡ��

    V(:,:)=exp(-j*pi*K'*sin(theta*pi/180));   %20*1
    %Sn=V*V'; %û�и���ʱΪ��ʽ �����׾���
    Sn=eye(M)+I*I';  % ������ź�������׾��󣬡��������д���333ҳ��ʽ��6.76��
    WW=v'*inv(Sn)*v;                         %1*1
    W=inv(Sn)*v/WW;                    %20*1
    B=W'*V;                %1*1
    P=abs(B);

P = 20*log10(P/max(P));
plot(theta,P);
grid on;
