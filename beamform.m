clear
clc
format long;
v=1;
M=3;
N=1000;%%%%%%%������
f0=16*10^3;%%%%%%%%%%%�ź�����ŵ�Ƶ��
f1=16*10^3;
f2=16*10^3;
omiga0=2*pi*f0;%%%%%%%�ź�����ŵĽ�Ƶ��
omiga1=2*pi*f1;
omiga2=2*pi*f2;
sita0=9.5941; %�źŷ���
sita1=77.8985; %���ŷ���1
sita2= 48.1114; %���ŷ���2
for t=1:N           %%%%%%%%%%%%�ź�
    adt(t)=sin(omiga0*t/(N*f0));
    a1t(t)=sin(omiga1*t/(N*f1));
    a2t(t)=sin(omiga2*t/(N*f2));
end
for i=1:M    %%%%%%%%%%%%�źŵĵ���ʸ�����������ʽ
    ad(i,1)=exp(j*(i-1)*pi*sin(sita0));
    a1(i,1)=exp(j*(i-1)*pi*sin(sita1));
    a2(i,1)=exp(j*(i-1)*pi*sin(sita2));
end
R=zeros(M,M);
for t=1:N
 x1=adt(t)*ad;
 x=adt(t)*ad+a1t(t)*a1+a2t(t)*a2; %���ж��źŵ�������Ӧ
     R=R+x*x';%�źŵ�Э�������
end
R=R/N;%%%%%%%%%Э����������п�������ƽ��
miu=1/(ad'*inv(R)*ad);%%%%%%���ò����LMS�㷨�Ĺ�ʽ�������Ҽǲ�̫�壬������������Ȩֵ�����������ʽ�����Ȼ���Ȩ
w=miu*inv(R)*ad;
%%%%%%�γɲ���%%%%%%%%%%%%%%%%%%%
for sita=0:pi/100:pi
    for i=1:M
        x_(i,1)=exp(j*(i-1)*pi*sin(sita));
    end
    y(1,v)=w'*x_;%%%%%%%���źŽ��м�Ȩ����������
    v=v+1;
end
y_max=max(y(:));%%%%%%%%%%%%%%%��һ��
y_1=y/y_max;
y_db=20*log(y_1);
 
sita=0:pi/100:pi;
plot(sita,y)
xlabel('sita');
ylabel('��������db');
