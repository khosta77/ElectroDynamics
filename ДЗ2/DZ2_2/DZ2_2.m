%% 
% В круглом заполненном воздухом волноводе диаметром (1+0,1·M+0,1·N)·5 см распространяется 
% волна типа H11. Частота колебаний 5 ·(1+0,002·N) ГГц, передаваемая мощность 
% (1+0,01·M)· 1 кВт. Определить максимальное значение напряженности электрического 
% поля в волноводе.
%% 
% * *КОНСТАНТЫ*

c = 3e8
e0 = 8.85e-12
m0 = 1.25e-6
%% 
% * *ДАНО*

M = 5; N = 12;
d = (1 + 0.12*M + 0.1*N)*5*1e-2 % см -> м!!!
f = (1 + 0.0022*N)*5*1e9
Watt = (1 + 0.012*M)*1e3
%% 
% $$M=5,N=12$$
% 
% $$d\;=0,14\;\left\lbrack м\right\rbrack$$
% 
% $$f\;=5,132\;\left\lbrack \textrm{ГГц}\right\rbrack$$
% 
% $$P_0 =1060\;\left\lbrack \textrm{Вт}\right\rbrack$$
% 
% $$\varepsilon_r \;=1$$
% 
% $$\mu_r =1$$
%% 
% * *НАЙТИ*
%% 
% Определить максимальное значение напряженности электрического поля в волноводе.
%% 
% * *РЕШЕНИЕ*
%% 
% Для начала определим радиус волновода
% 
% $$a=\frac{d}{2}=\frac{0,14}{2}=0,07\;\left\lbrack м\right\rbrack \ldotp$$

a = d/2
%% 
% Длина волны в среде волновода (среда неограниченная)
% 
% $$\lambda =\frac{c}{f},\left(\varepsilon_r =\mu_r =1\right)$$
% 
% $$\lambda =\frac{3\cdot {10}^8 }{5,132\cdot {10}^9 }=0,058\;\left\lbrack м\right\rbrack 
% \ldotp$$

lamda = c/f
%% 
% Волновое сопротивление среды
% 
% $$Z_0 =\sqrt{\frac{\mu_a }{\varepsilon_a }}=\sqrt{\frac{\mu_0 }{\varepsilon_0 
% }}=120\cdot \pi =377\;\left\lbrack \textrm{Ом}\right\rbrack \ldotp$$

Z0 = 120 * pi
%% 
% Критическая длина волны для H11
% 
% $$\lambda_{\textrm{кр}} =3,41\cdot a=3,41\cdot 0,07=0,23\;\left\lbrack м\right\rbrack 
% \ldotp$$

lamda_krit = 3.41 * a
%% 
% Мощность, переносимая волной любого типа в волноводе
% 
% $$P_0 =\frac{1}{2}\int_S \textrm{Re}\left\lbrace \overrightarrow{z_0 } \cdot 
% \left\lbrack \overrightarrow{\dot{E} } ,\overrightarrow{\dot{H^* } } \right\rbrack 
% \right\rbrace \textrm{dS},$$
% 
% $$\textrm{где}\;\overrightarrow{z_0 } -\textrm{орт}\;\textrm{оси},\;\textrm{вдоль}\;\textrm{которой}\;\textrm{распростаняется}\;\textrm{волна}\ldotp$$
% 
% Для волны Н11 в круглом волноводе
% 
% $$P_{\textrm{ср}} =\frac{\pi a^2 E_0^2 }{4,28\cdot Z_0 }\sqrt{1-{\left(\frac{\lambda 
% }{\lambda_{\textrm{кр}} }\right)}^2 },\Longrightarrow E_0 =\sqrt{\frac{4,28\cdot 
% Z_0 \cdot P_{\textrm{ср}} }{\pi a^2 \sqrt{1-{\left(\frac{\lambda }{\lambda_{\textrm{кр}} 
% }\right)}^2 }}},$$
% 
% $$E_0 =\sqrt{\frac{4,28\cdot 377\cdot 1060}{\pi \cdot 0,{07}^2 \cdot \sqrt{1-{\left(\frac{0,058}{0,23}\right)}^2 
% }}}=10705\;\left\lbrack \frac{В}{м}\right\rbrack \ldotp$$

E0 = sqrt((4.28 * Z0 * Watt)/(pi * a^2 * sqrt(1 - (lamda/lamda_krit)^2)))