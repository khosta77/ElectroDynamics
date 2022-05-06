%% 
% В прямоугольном волноводе сечением 23х10 мм^2 распространяется волна типа 
% Н10. Волновод заполнен диэлектриком с относительной диэлектрической проницаемостью 
% _εr_ = (1+0,2·M+0,01·N) и относительной магнитной проницаемостью _µr_ = 1. Амплитуда 
% напряженности электрического поля в центре волновода равна (M+2,2·N)·10^5 В/м. 
% Частота колебаний (1+0,005·N)·10 ГГц. Записать выражения для составляющих поля 
% волны, определить мощность, передаваемую волной, фазовую и групповую скорости, 
% длину волны в волноводе, а также плотности поверхностных токов на стенках (плотности 
% поверхностных токов записать в виде выражений для четырех стенок).
%% 
% * *КОНСТАНТЫ*

c = 3e8
e0 = 8.85e-12
m0 = 1.25e-6
%% 
% * *ДАНО*

M = 5; N = 12;
a = 0.023
b = 0.01
er = 1 + 0.25*M + 0.01*N
%% 
% $$\varepsilon_r =2,37$$ $$\mu_r =1$$$$f=10,96\;\left\lbrack \textrm{ГГц}\right\rbrack$$$$Е_0 
% =338000\;\left\lbrack \frac{В}{м}\right\rbrack$$

mr = 1
f = (1 + 0.008*N)*10*1e9
Em = (M + 2.4*N)*1e4
%% 
% * *НАЙТИ*
%% 
% Записать выражения для составляющих поля волны
% 
% определить мощность, передаваемую волной
% 
% фазовую и групповую скорости
% 
% длину волны в волноводе  
% 
% плотности поверхностных токов на стенках (плотности поверхностных токов записать 
% в виде выражений для четырех стенок).
%% 
% * *РЕШЕНИЕ*
%% 
% Поле $H_{10}$ в прямоугольном волноводе:
% 
% $$\dot{H_{\mathrm{m3}} } =H\cdot \cos \left(\frac{\pi x_1 }{a}\right)\cdot 
% e^{-{\mathrm{ik}}_0 x_3 }$$
% 
% $$\dot{H_{\mathrm{m1}} } =i\cdot \frac{2a}{\lambda }\cdot \sqrt{1-{\left(\frac{\lambda 
% }{2a}\right)}^2 }\cdot H\cdot \sin \left(\frac{\pi x_1 }{a}\right)\cdot e^{-{\mathrm{ik}}_0 
% x_3 }$$
% 
% $$\dot{E_{\mathrm{m2}} } =-i\cdot \frac{2a}{\lambda }\cdot Z_0 \cdot \sin 
% \left(\frac{\pi x_1 }{a}\right)\cdot e^{-{\mathrm{ik}}_0 x_3 }$$
% 
% $$\dot{H_{\textrm{m2}} } =0;\;\dot{E_{\textrm{m1}} } =0;\;\dot{E_{\textrm{m3}} 
% } =0$$
% 
% Критическая длина волны для поля $H_{10}$ в прямоугольном волноводе
% 
% $$\lambda_{\textrm{кр}} =2a\Longrightarrow \lambda_{\textrm{кр}} =2\cdot 0,023=0,046\;\left\lbrack 
% м\right\rbrack \ldotp$$

lamda_kra = 2*a
%% 
% Длина волны в среде волновода, при условии что она не ограничена
% 
% $$\lambda =\frac{\lambda_0 }{\sqrt{\varepsilon_r }},$$
% 
% где $\lambda_0$ - длина волны в воздухе.
% 
% $$\lambda_0 =\frac{с}{f}=\frac{3\cdot {10}^8 }{1,096\cdot {10}^{10} }=0,027\;\left\lbrack 
% м\right\rbrack ,$$

lamda_0 = c/f
%% 
% $$\lambda =\frac{0,0283}{\sqrt{2,12}}=0,017\;\left\lbrack м\right\rbrack \ldotp$$

lamda = lamda_0 / sqrt(er)
%% 
% Длина волны в волноводе 
% 
% $$\Lambda =\frac{\lambda }{\sqrt{1-{\left(\frac{\lambda }{\lambda_{\textrm{кр}} 
% }\right)}^2 }}=\frac{0,017}{\sqrt{1-{\left(\frac{0,017}{0,046}\right)}^2 }}=0,019\left\lbrack 
% м\right\rbrack \ldotp$$

Lamda = lamda / sqrt(1 - (lamda/lamda_kra)^2)
%% 
% Продольная постоянная распространения 
% 
% $$k_0 =k\cdot \sqrt{1-{\left(\frac{\lambda }{\lambda_{\textrm{кр}} }\right)}^2 
% }=\frac{2\pi }{\lambda }\cdot \sqrt{1-{\left(\frac{\lambda }{\lambda_{\textrm{кр}} 
% }\right)}^2 },$$
% 
% $$k_0 =\frac{2\pi }{0,017}\cdot \sqrt{1-{\left(\frac{0,017}{0,046}\right)}^2 
% }=325,916\;\left\lbrack \frac{1}{м}\right\rbrack \ldotp$$

k_0 = (2*pi/lamda)*sqrt(1 - (lamda/lamda_kra)^2)
%% 
% Характеристическое сопротивление среды, заполняющие волновод
% 
% $$Z_0 =\sqrt{\frac{\mu_a }{\varepsilon_a }}=\sqrt{\frac{\mu_0 }{\varepsilon_r 
% \varepsilon_0 }}=\sqrt{\frac{1,25\cdot {10}^6 }{2,37\cdot 8,85\cdot {10}^{-12} 
% }}=244,12\;\left\lbrack \textrm{Ом}\right\rbrack \ldotp$$

Z_0 = sqrt(m0/(er*e0))
%% 
% Характеристическое сопротивление волновода для волны $H_{10}$
% 
% $$Z_{\textrm{OH}} =\frac{Z_0 }{\sqrt{1-{\left(\frac{\lambda }{2a}\right)}^2 
% }}=\frac{244,12}{\sqrt{1-{\left(\frac{0,017}{2\cdot 0,023}\right)}^2 }}=264,69\;\left\lbrack 
% \textrm{Ом}\right\rbrack \ldotp$$

Z_OH = Z_0 / sqrt(1 - (lamda/(2*a))^2)
%% 
% Определим масштабный множитель H
% 
% $$\left|\dot{E_{\textrm{m2}} } \right|=\frac{2a}{\lambda }Z_0 H\cdot \sin 
% \frac{\pi }{a}\cdot \frac{a}{2}=\frac{2a}{\lambda }Z_0 H\Longrightarrow$$
% 
% $$H=\frac{\left|\dot{E_{\textrm{m2}} } \right|\cdot \lambda }{2a\cdot Z_0 
% }=\frac{E_0 \cdot \lambda }{2a\cdot Z_c }$$
% 
% $$H=\frac{0,017\cdot 3,38\cdot {10}^6 }{0,046\cdot 244,123}=533\;\left\lbrack 
% \frac{A}{м}\right\rbrack \ldotp$$

H = (lamda*Em)/(lamda_kra*Z_0)
%% 
% Выразим для составляющих поля в численном виде
% 
% $$\dot{H_{{\mathrm{mx}}_3 } } =533\cdot \cos \left(\frac{\pi x_1 }{0,023}\right)\cdot 
% e^{-i\cdot 325,91\cdot x_3 } \;\left\lbrack \frac{A}{м}\right\rbrack$$
% 
% $$\dot{H_{{\mathrm{mx}}_1 } } =i\cdot \frac{2\cdot 0,023}{0,017}\cdot \sqrt{1-{\left(\frac{0,017}{2\cdot 
% 0,023}\right)}^2 }\cdot 533\;\cdot \sin \left(\frac{\pi x_1 }{0,023}\right)\cdot 
% e^{-i\cdot 325,91\cdot x_3 } \;\left\lbrack \frac{A}{м}\right\rbrack ,$$
% 
% $$\dot{H_{{\mathrm{mx}}_1 } } =i\cdot 1340\cdot \sin \left(\frac{\pi x_1 }{0,023}\right)\cdot 
% e^{-i\cdot 325,91\cdot z} \;\left\lbrack \frac{A}{м}\right\rbrack ,$$
% 
% $$\dot{E_{{\mathrm{mx}}_2 } } =-i\cdot \frac{2\cdot 0,023}{0,017}\cdot 244,12\cdot 
% \sin \left(\frac{\pi x_1 }{0,023}\right)\cdot e^{-i\cdot 325,91\cdot x_3 } \;\left\lbrack 
% \frac{В}{м}\right\rbrack ,$$
% 
% $$\dot{E_{{\mathrm{mx}}_2 } } =-i\cdot 660,56\cdot \sin \left(\frac{\pi x_1 
% }{0,023}\right)\cdot e^{-i\cdot 325,91\cdot x_3 } \;\left\lbrack \frac{В}{м}\right\rbrack 
% ,$$
% 
% $$\dot{H_{\textrm{m2}} } =0\left\lbrack \frac{A}{м}\right\rbrack ;\;\dot{E_{\textrm{m1}} 
% } =0\;\left\lbrack \frac{В}{м}\right\rbrack ;\;\dot{E_{\textrm{m3}} } =0\;\left\lbrack 
% \frac{В}{м}\right\rbrack \ldotp$$
% 
% Мощность, передаваемая волноводом. Мощность, переносимая волной любого типа 
% в волноводе
% 
% $$P_0 =\frac{1}{2}\int_S \textrm{Re}\left\lbrace \overrightarrow{z_0 } \cdot 
% \left\lbrack \overrightarrow{\dot{E} } ,\overrightarrow{\dot{H^* } } \right\rbrack 
% \right\rbrace \textrm{dS},$$
% 
% $$\textrm{где}\;\overrightarrow{z_0 } -\textrm{орт}\;\textrm{оси},\;\textrm{вдоль}\;\textrm{которой}\;\textrm{распростаняется}\;\textrm{волна}\ldotp$$
% 
% Для волны Н10 в прямоугольном волноводе
% 
% $$P_0 =\frac{\textrm{ab}\sqrt{1-{\left(\frac{\lambda }{2a}\right)}^2 }}{4Z_0 
% }E_0^2 ,$$
% 
% $$P_0 =\frac{0,023\cdot 0,01\cdot \sqrt{1-{\left(\frac{0,017}{2\cdot 0,023}\right)}^2 
% }}{4\cdot 244,12}\cdot {\left(3,38\cdot {10}^6 \right)}^2 =24817\;\left\lbrack 
% \textrm{Вт}\right\rbrack \ldotp$$

P = (a*b*sqrt(1 - (lamda/(2*a))^2)*Em^2)/(4*Z_0)
%% 
% Фазовая и групповая скорость
% 
% $$\upsilon_ф =\frac{\frac{c}{\sqrt{\varepsilon_r \mu_r }}}{\sqrt{1-{\left(\frac{\lambda 
% }{\lambda_{\textrm{кр}} }\right)}^2 }}=\frac{\frac{3\cdot {10}^8 }{\sqrt{2,37\cdot 
% 1}}}{\sqrt{1-{\left(\frac{0,017}{0,046}\right)}^2 }}=2,11\cdot {10}^8 \;\left\lbrack 
% \frac{м}{с}\right\rbrack ,$$

V_phaza = (c/sqrt(er))/sqrt(1 - (lamda/lamda_kra)^2)
%% 
% $$\upsilon_г =\frac{c}{\sqrt{\varepsilon_r \mu_r }}\cdot \sqrt{1-{\left(\frac{\lambda 
% }{\lambda_{\textrm{кр}} }\right)}^2 }=\frac{3\cdot {10}^8 }{\sqrt{2,37\cdot 
% 1}}\cdot \sqrt{1-{\left(\frac{0,017}{0,046}\right)}^2 }=1,79\cdot {10}^8 \;\left\lbrack 
% \frac{м}{с}\right\rbrack \ldotp$$

V_grup = (c/sqrt(er)) * sqrt(1 - (lamda/lamda_kra)^2)
%% 
% Плотность поверхностных токов
% 
% $$\overrightarrow{J_{\textrm{пов}} } =\left\lbrack \overrightarrow{n_0 } \overrightarrow{H} 
% \right\rbrack ,$$
% 
% 1) На левой стенке
% 
% $$\overrightarrow{n_{\textrm{ол}} } =\left\lbrack 0,\;1,\;0\right\rbrack$$
% 
% Составляющие поля (х1 = 0)
% 
% $$\dot{H_{\textrm{m3}} } |_{x_1 =0} =533\cdot e^{-j\cdot 325,91\cdot x_3 } 
% \left\lbrack \frac{А}{м}\right\rbrack$$
% 
% $$\dot{H_{\textrm{m2}} } |_{x_1 =0} =0\left\lbrack \frac{А}{м}\right\rbrack$$
% 
% $$\dot{H_{\textrm{m1}} } |_{x_1 =0} =0\left\lbrack \frac{А}{м}\right\rbrack$$ 
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp л\ldotp } } =\left\lbrack \begin{array}{ccc}\overrightarrow{e_{x_1 
% } }  & \overrightarrow{e_{x_2 } }  & \overrightarrow{e_{x_3 } } \\1 & 0 & 0\\0 
% & 0 & \dot{H_{\textrm{m3}} } \end{array}\right\rbrack =-\dot{H_{\textrm{m3}} 
% } \cdot \overrightarrow{e_{x_2 } } \Longrightarrow$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp л\ldotp x_1 } } =\overrightarrow{j_{\textrm{пов}\ldotp 
% л\ldotp x_3 } } =0\;\left\lbrack \frac{A}{м}\right\rbrack$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp л\ldotp x_2 } } =-533\cdot e^{-j\cdot 
% 325,91\cdot x_3 } \;\left\lbrack \frac{А}{м}\right\rbrack$$
% 
% 2) На правой стенке
% 
% $$\overrightarrow{n_{\textrm{оп}} } =\left\lbrack -1,0,\;0\right\rbrack$$
% 
% Составляющие поля (х1 = a)
% 
% $$\dot{H_{\textrm{m3}} } |_{x=a} =533\cdot e^{-j\cdot 325,91\cdot x_3 } \;\left\lbrack 
% \frac{А}{м}\right\rbrack$$
% 
% $$\dot{H_{\textrm{m2}} } |_{x=a} =0\;\left\lbrack \frac{А}{м}\right\rbrack$$
% 
% $$\dot{H_{\textrm{m1}} } |_{x=a} =0\;\left\lbrack \frac{А}{м}\right\rbrack$$ 
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp п\ldotp } } =\left\lbrack \begin{array}{ccc}\overrightarrow{e_{x_1 
% } }  & \overrightarrow{e_{x_2 } }  & \overrightarrow{e_{x_3 } } \\-1 & 0 & 0\\0 
% & 0 & \dot{H_{\textrm{m3}} } \end{array}\right\rbrack =\dot{H_{\textrm{m3}} 
% } \cdot \overrightarrow{e_{x_2 } } \Longrightarrow$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp п\ldotp x_1 } } =\overrightarrow{j_{\textrm{пов}\ldotp 
% п\ldotp x_3 } } =0\;\left\lbrack \frac{A}{м}\right\rbrack$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp п\ldotp x_2 } } =533\cdot e^{-j\cdot 
% 325,91\cdot x_3 } \;\left\lbrack \frac{А}{м}\right\rbrack$$
% 
% 3) На верхней стенке
% 
% $$\overrightarrow{n_{\textrm{ов}} } =\left\lbrack 0,\;-1,\;0\right\rbrack$$
% 
% Составляющие поля не зависят от x2
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp в\ldotp } } =\left\lbrack \begin{array}{ccc}\overrightarrow{e_{x_1 
% } }  & \overrightarrow{e_{x_2 } }  & \overrightarrow{e_{x_3 } } \\0 & -1 & 0\\\dot{H_{\textrm{m1}} 
% }  & 0 & \dot{H_{\textrm{m3}} } \end{array}\right\rbrack =\;-\overrightarrow{e_{x_1 
% } } \dot{H_{\textrm{m3}} } \;+\overrightarrow{e_{x_3 } } \dot{H_{\textrm{m1}} 
% } \Longrightarrow$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp в\ldotp x_1 } } =533\cdot \cos \left(\frac{\pi 
% x_1 }{0,023}\right)\cdot e^{-j\cdot 325,91\cdot x_3 } \;\left\lbrack \frac{А}{м}\right\rbrack$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp в\ldotp x_2 } } =0\;\left\lbrack \frac{А}{м}\right\rbrack$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp в\ldotp x_3 } } =-i\cdot 1340\cdot 
% \sin \left(\frac{\pi x_1 }{0,023}\right)\cdot e^{-j\cdot 325,91\cdot x_3 } \;\left\lbrack 
% \frac{А}{м}\right\rbrack$$
% 
% 4) На нижней стенке
% 
% $$\overrightarrow{n_{\textrm{он}} } =\left\lbrack 0,1,0\right\rbrack$$
% 
% Составляющие поля не зависят от x2
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp н\ldotp } } =\left\lbrack \begin{array}{ccc}\overrightarrow{e_{x_1 
% } }  & \overrightarrow{e_{x_2 } }  & \overrightarrow{e_{x_3 } } \\0 & 1 & 0\\\dot{H_{\textrm{m1}} 
% }  & 0 & \dot{H_{\textrm{m3}} } \end{array}\right\rbrack =\;\overrightarrow{e_{x_1 
% } } \dot{H_{\textrm{m3}} } -\overrightarrow{e_{x_3 } } \dot{H_{\textrm{m1}} 
% } \Longrightarrow$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp н\ldotp x_1 } } =-533\cdot \cos \left(\frac{\pi 
% x_1 }{0,023}\right)\cdot e^{-j\cdot 325,91\cdot x_3 } \;\left\lbrack \frac{А}{м}\right\rbrack 
% ,$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp н\ldotp x_2 } } =0\;\left\lbrack \frac{А}{м}\right\rbrack 
% ,$$
% 
% $$\overrightarrow{j_{\textrm{пов}\ldotp н\ldotp x_3 } } =i\cdot 1340\cdot 
% \sin \left(\frac{\pi x_1 }{0,023}\right)\cdot e^{-j\cdot 325,91\cdot x_3 } \;\left\lbrack 
% \frac{А}{м}\right\rbrack \ldotp$$