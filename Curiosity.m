function varargout = Curiosity(varargin)
% CURIOSITY M-file for Curiosity.fig
%      CURIOSITY, by itself, creates a new CURIOSITY or raises the existing
%      singleton*.
%
%      H = CURIOSITY returns the handle to a new CURIOSITY or the handle to
%      the existing singleton*.
%
%      CURIOSITY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CURIOSITY.M with the given input arguments.
%
%      CURIOSITY('Property','Value',...) creates a new CURIOSITY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Curiosity_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      manualny.  All inputs are passed to Curiosity_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Curiosity

% Last Modified by GUIDE v2.5 19-Jan-2015 23:30:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Curiosity_OpeningFcn, ...
                   'gui_OutputFcn',  @Curiosity_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Curiosity is made visible.
function Curiosity_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Curiosity (see VARARGIN)

% Choose default command line output for Curiosity
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Curiosity wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clc;
imshow('pia16207-43.jpg')
handles.n=1; % wspolczynnik czasu
hMarker=line(25,25,'linestyle','none','Tag','Marker',...
                    'marker','o',...      % poczatkowe ustawienie markera
                    'MarkerSize',15,...
                    'markeredgecolor','black',...
                    'markerfacecolor','r');
handles.was = 0;
handles.was1 = 0;
handles.was2 = 0;
handles.was3 = 0;
handles.was4 = 0;
handles.was5 = 0;
handles.was6 = 0;

guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Curiosity_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

set(handles.opcjap,'Enable','off');
set(handles.opcja1,'Enable','off');
set(handles.opcja2,'Enable','off');
set(handles.opcja3,'Enable','off');
set(handles.opcja4,'Enable','off');
set(handles.opcja5,'Enable','off');
set(handles.opcja6,'Enable','off');
set(handles.opcjak,'Enable','off');

guidata(hObject, handles)

% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Main code excutes on button press
% Zamiany w GUI po uruchomieniu
set(handles.start,'BackgroundColor','green');
set(handles.start,'Enable','off')
% warunek auto/manual
if handles.manual == 1
    % Manualne wybieranie przebiego probki po ukladzie
	cel = menu('Wybierz cel pr�bki','SAM1','SAM2','CHEMIN','TACKA');
	while 1
		if cel == 1 || cel == 2 || cel == 3 || cel == 4
			break;
		else
		   cel = menu('Wybierz cel probki','SAM1','SAM2','CHEMIN','TACKA');
		end
	end
	if cel == 3 || cel == 4
		sito = 2;
	else
		sito = menu('Wybierz rozmiar probki','Sito 1mm','Sito 150 mikro metrow');                 
			while 1
				if sito == 1 || sito == 2
					break;
				else
					sito = menu('Wybierz rozmiar pr�bki','Sito 1mm','Sito 150 mikro metrow'); 
				end     
			end
	end
		wl = menu('Wybierz �r�d�o pr�bki','�y�ka','Wiert�o'); 
			while 1
				if wl == 1 || wl == 2
					break;
				else
					wl = menu('Wybierz �r�d�o pr�bki','�y�ka','Wiert�o'); 
				end     
			end  
else 
    % tryb automatyczny
    % losowanie celu
    cel = fix(rand*4+1);   %'SAM1','SAM2','CHEMIN','TACKA');
    %opis co wybrano
    if cel == 1
        set(handles.opis2,'string','Jako cel automatycznie obrano SAM1');
        pause(handles.n*1)
        set(handles.opis2,'string','');
    elseif cel == 2
        set(handles.opis2,'string','Jako cel automatycznieobrano SAM2');
        pause(handles.n*1)
        set(handles.opis2,'string','');
    elseif cel == 3
        set(handles.opis2,'string','Jako cel automatycznie obrano CHEMIN');
        pause(handles.n*1)
        set(handles.opis2,'string','');
    else
        set(handles.opis2,'string','Jako cel automatycznie obrano tack� obserwacyjn�');
        pause(handles.n*1)
        set(handles.opis2,'string','');
    end
    switch cel
        case 1
            sito = fix(rand*2+1); %'Sito 1mm','Sito 150 mikro metrow');
            if sito == 2
				set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 150 mikro metrow');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                wl = fix(rand*2+1); %'�y�ka','Wiert�o')
				if wl == 1
					set(handles.opis2,'string','Jako �r�d�o pr�bki automatycznie obrano �y�k�');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
				else
					set(handles.opis2,'string','Jako �r�d�o pr�bki automatycznie obrano wyj�cie od wiert�a');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
				end
            else
				set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 1mm');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                wl = 1;
            end
        case 2
            sito = fix(rand*2+1); %'Sito 1mm','Sito 150 mikro metrow');
            if sito == 2
				set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 150 mikro metrow');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                wl = fix(rand*2+1); %'�y�ka','Wiert�o')
				if wl == 1
					set(handles.opis2,'string','Jako �r�d�o pr�bki automatycznie obrano �y�k�');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
				else
					set(handles.opis2,'string','Jako �r�d�o pr�bki automatycznie obrano wyj�cie od wiert�a');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
				end
            else
				set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 1mm');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                wl = 1;
            end
        case 3
            sito = 2;
            wl = fix(rand*2+1) %'�y�ka','Wiert�o');
            if wl == 1
                set(handles.opis2,'string','Jako �r�d�o pr�bki automatycznie obrano �y�k�');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            else
                set(handles.opis2,'string','Jako �r�d�o pr�bki automatycznie obrano wyj�cie od wiert�a');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            end            
        case 4
		    sito = fix(rand*2+1); %'Sito 1mm','Sito 150 mikro metrow');   
            if sito == 1
                set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 1mm');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            else 
                set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 150 mikro metrow');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            end
            wl = fix(rand*2+1); %'�y�ka','Wiert�o');         
            if wl == 1
                set(handles.opis2,'string','Jako �r�d�o pr�bki automatycznie obrano �y�k�');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            else
                set(handles.opis2,'string','Jako �r�d�o pr�bki automatycznie obrano wyj�cie od wiert�a');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            end
    end    
end
handles.order = 0;
while 1
    switch handles.order
        case 0 % Przygotowanie komponentow\
            set(handles.opis2,'string','System przygotowany do startu');
            pause(handles.n*2)
            set(handles.opis2,'string','');
			handles.order = 1;
			guidata(hObject, handles);
        case 1 
            if wl == 1% Lyzka
                set(handles.lyzka,'BackgroundColor','green');
                hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
                    'Xdata',280,...
                    'YData',600,...
                    'marker','o',...    % lyzka
                    'MarkerSize',15,...
                    'markeredgecolor','black',...
                    'markerfacecolor','r');
                set(handles.opis2,'string','Pobieranie materia�u �y�k� z pod�o�a');
                pause(handles.n*3)
                if rand <= 0.3 % awaria lyzki
                    set(handles.opis2,'string','');
                    set(handles.awaria,'BackgroundColor','red');
                    set(handles.opis,'string','�y�ka nie mo�e pobra� materia�u!');
                    pause(handles.n*1)
                    set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi ponowne pobranie materialu');
                    set(handles.opis2,'string','Pobieranie materia�u �y�k� z pod�o�a');
                    probkilyzka = xlsread('probkilyzka.xls'); % pobieranie danych
                    probkalyzka = randsample(probkilyzka,1);
                    pause(handles.n*3)
                    set(handles.awaria,'BackgroundColor','default');
                    set(handles.opis,'string','');
                    set(handles.rozwiazanie,'string','');
                    set(handles.lyzka,'BackgroundColor','default');
                    set(handles.opis2,'string','');
                else
                    probkilyzka = xlsread('probkilyzka.xls'); % pobieranie danych
                    probkalyzka = randsample(probkilyzka,1);
                    set(handles.lyzka,'BackgroundColor','default');
                    set(handles.opis2,'string','');
                end
                set(handles.opis2,'string','SUKCES!');
				set(handles.opis3,'string',probkalyzka);
                pause(handles.n*1)
                set(handles.opis2,'string','');
                handles.order = 2;
            else % Wiertlo
                hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
                'Xdata',180,...
                'YData',110,...
                'marker','o',...    % wiertlo
                'MarkerSize',15,...
                'markeredgecolor','black',...
                'markerfacecolor','r');
                set(handles.opis2,'string','Pobieranie probki od wiertla');
                probkiwiertlo = xlsread('probkiwiertlo.xls'); % pobieranie danych
                probkawiertlo = randsample(probkiwiertlo,1)
                pause(handles.n*2)
                set(handles.opis2,'string','SUKCES!');
				set(handles.opis3,'string',probkawiertlo);
                handles.order = 2;
            end
            guidata(hObject, handles);
        case 2 % Przemieszenie
             set(handles.wibracje,'BackgroundColor','green');
             set(handles.przemieszczanie,'BackgroundColor','green');
			 hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
			 'marker','*',...    % przemieszczenie
			 'MarkerSize',15,...
			 'markerfacecolor','r');
             set(handles.opis2,'string','Transportowanie probki do filtracji');
             pause(handles.n*2)
			 if wl == 1
				 if probkalyzka >= 1
					set(handles.awaria,'BackgroundColor','red');
					set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mie�ci si� w kanale transportowym.');
					pause(handles.n*1)
					set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi usuni�cie pr�bki i pobranie na nowo.');
					pause(handles.n*3)
					set(handles.awaria,'BackgroundColor','default');
					set(handles.wibracje,'BackgroundColor','default');
					set(handles.przemieszczanie,'BackgroundColor','default');
					set(handles.opis,'string','');
					set(handles.opis2,'string','');
					set(handles.rozwiazanie,'string','');
					% Pobieranie na nowo
					set(handles.lyzka,'BackgroundColor','green');
					hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
					'Xdata',280,...
					'YData',600,...
					'marker','o',...    % lyzka
					'MarkerSize',15,...
					'markeredgecolor','black',...
					'markerfacecolor','r');				
					set(handles.opis2,'string','Pobieranie materia�u �y�k� z pod�o�a');
					probkilyzka = xlsread('probkilyzka.xls','A1:A100'); % pobieranie danych / awaria
					probkalyzka = randsample(probkilyzka,1);
					set(handles.opis3,'string',probkalyzka);
					pause(handles.n*3)
					set(handles.lyzka,'BackgroundColor','default');
					set(handles.opis2,'string','SUKCES!');
					pause(handles.n*1)
					set(handles.opis2,'string','');
					set(handles.wibracje,'BackgroundColor','green');
					set(handles.przemieszczanie,'BackgroundColor','green');
					hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
					'marker','*',...    % przemieszczenie
					'MarkerSize',15,...
					'markerfacecolor','r');
					set(handles.opis2,'string','Transportowanie probki do filtracji');
					pause(handles.n*2)
					handles.order = 2;
				 end
			end
            set(handles.wibracje,'BackgroundColor','default');
            set(handles.przemieszczanie,'BackgroundColor','default');
            set(handles.opis2,'string','SUKCES!');
            pause(handles.n*1)
            set(handles.opis2,'string','');
            handles.order = 3;
			guidata(hObject, handles);
        case 3
            if sito == 1 % Sito1mm
                set(handles.opis2,'string','Przesiewanie probki przez sito 1mm');
				hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
                'Xdata',320,...
                'YData',400,...
                'marker','o',...    % sito
                'MarkerSize',15,...
                'markeredgecolor','black',...
                'markerfacecolor','r');
                pause(handles.n*3)
				if wl == 1
					 if probkalyzka >= 1
						set(handles.opis2,'string','');
						set(handles.awaria,'BackgroundColor','red');
						set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mozna przesiac przez sito.');
						pause(handles.n*1)
						set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi przekazanie probki do rozdrabniania.');
						pause(handles.n*3)
						set(handles.awaria,'BackgroundColor','default');
						set(handles.opis,'string','');
						set(handles.rozwiazanie,'string','');
						set(handles.rozdrabniacz,'BackgroundColor','green');
						hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
						'Xdata',400,...
						'YData',230,...
						'marker','o',...    % rozdrabnianie
						'MarkerSize',15,...
						'markeredgecolor','black',...
						'markerfacecolor','r');
						set(handles.opis2,'string','Rozdrabnianie probki');
						probkilyzka = xlsread('probkilyzka.xls','A1:A150'); % pobieranie danych / rozdrabnianie
						probkalyzka = randsample(probkilyzka,1);
						pause(handles.n*2)
						set(handles.opis3,'string',probkalyzka)
						set(handles.rozdrabniacz,'BackgroundColor','default');			
					 end
				end
					set(handles.opis2,'string','SUKCES!');
					pause(handles.n*1)
					set(handles.opis2,'string','');
					handles.order = 4;
            else % Sito150 mikro metrow
                 set(handles.opis2,'string','Przesiewanie probki przez sito 150 mikro metrow');
				 hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
                 'Xdata',320,...
                 'YData',400,...
                 'marker','o',...    % sito
                 'MarkerSize',15,...
                 'markeredgecolor','black',...
                 'markerfacecolor','r');
                 pause(handles.n*3)
				 if wl == 2
					if probkawiertlo >= 0.00015
						  set(handles.opis2,'string','');
						  set(handles.awaria,'BackgroundColor','red');
						  set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mozna przesiac przez sito.');
						  pause(handles.n*1)
						  set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi przekazanie probki do rozdrabniania.');
						  pause(handles.n*3)
						  set(handles.awaria,'BackgroundColor','default');
						  set(handles.opis,'string','');
						  set(handles.rozwiazanie,'string','');
						  set(handles.rozdrabniacz,'BackgroundColor','green');
						  hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
						 'Xdata',400,...
						 'YData',230,...
						 'marker','o',...    % rozdrabnianie
						 'MarkerSize',15,...
						 'markeredgecolor','black',...
						 'markerfacecolor','r');
						  set(handles.opis2,'string','Rozdrabnianie probki');
						  probkiwiertlo = xlsread('probkiwiertlo.xls','A1:A150'); % pobieranie danych / rozdrabnianie
						  probkawiertlo = randsample(probkiwiertlo,1);
						  pause(handles.n*2)
						  set(handles.opis3,'string',probkawiertlo)
					end
				 end
                      set(handles.rozdrabniacz,'BackgroundColor','default');
                      set(handles.opis2,'string','SUKCES!');
                      pause(handles.n*1)
                      set(handles.opis2,'string','');
                   handles.order = 4;
            end
            guidata(hObject, handles);
        case 4 % Przemieszczenie
              set(handles.wibracje,'BackgroundColor','green');
              set(handles.przemieszczanie,'BackgroundColor','green');
			  hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
			  'marker','*',...    % przemieszczenie
			  'MarkerSize',15,...
			  'markerfacecolor','r');
              set(handles.opis2,'string','Transportowanie probki do formowania');
              pause(handles.n*3)
              set(handles.wibracje,'BackgroundColor','default');
              set(handles.przemieszczanie,'BackgroundColor','default');
              set(handles.opis2,'string','');
              set(handles.opis2,'string','SUKCES!');
              pause(handles.n*1)
              set(handles.opis2,'string','');
              handles.order = 5;
              guidata(hObject, handles);
        case 5 % Formowanie porcji
              set(handles.porcjowanie,'BackgroundColor','green');
			  hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
			  'Xdata',480,...
			  'YData',600,...
			  'marker','o',...    % porcjowanie
			  'MarkerSize',15,...
			  'markeredgecolor','black',...
			  'markerfacecolor','r');
              set(handles.opis2,'string','Formowanie porcji w celu dalszego transportu do celu');
              pause(handles.n*3)
              if rand <= 0.5
                  set(handles.opis2,'string','');
                  set(handles.awaria,'BackgroundColor','red');
                  set(handles.opis,'string','Nast�pi� b��d przy formowaniu porcji z pr�bki.');
                  pause(handles.n*1)
                  set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi kolejna pr�ba formowania pr�bki.');
                  pause(handles.n*3)
                  set(handles.awaria,'BackgroundColor','default');
                  set(handles.opis,'string','');
                  set(handles.rozwiazanie,'string','');
                  set(handles.opis2,'string','Formowanie porcji w celu dalszego transportu do celu');
                  set(handles.porcjowanie,'BackgroundColor','green');
                  pause(handles.n*3)
                  set(handles.porcjowanie,'BackgroundColor','default');
                  set(handles.opis2,'string','SUKCES!');
                  pause(handles.n*1)
                  set(handles.opis2,'string','');
              else
                  set(handles.porcjowanie,'BackgroundColor','default');
                  set(handles.opis2,'string','SUKCES!');
                  pause(handles.n*1)
                  set(handles.opis2,'string','');
              end
              handles.order = 6;
              guidata(hObject, handles);
        case 6 % Przemieszczenie
              set(handles.wibracje,'BackgroundColor','green');
              set(handles.przemieszczanie,'BackgroundColor','green');
		 	  hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
		 	  'marker','*',...    % przemieszczenie
		 	  'MarkerSize',15,...
			  'markerfacecolor','r');
              set(handles.opis2,'string','Transportowanie probki do celu');
              pause(handles.n*3)
              set(handles.wibracje,'BackgroundColor','default');
              set(handles.przemieszczanie,'BackgroundColor','default');
              set(handles.opis2,'string','SUKCES!');
              pause(handles.n*1)
              set(handles.opis2,'string','');
              handles.order = 7;
              guidata(hObject, handles);
        case 7 %cel
              if cel == 1 % Sam1
                 set(handles.sam1,'BackgroundColor','green');
				 hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
				 'Xdata',38,...
				 'YData',727,...
				 'marker','o',...    % sam1
				 'MarkerSize',15,...
				 'markeredgecolor','black',...
				 'markerfacecolor','r');
                  set(handles.opis2,'string','Probka dostala sie do SAM1');
                  pause(handles.n*3)
                  set(handles.sam1,'BackgroundColor','default');
                  set(handles.opis2,'string','');
                  handles.order = 8; 
              elseif cel == 2 % Sam2
                  set(handles.sam2,'BackgroundColor','green');
				  hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
				 'Xdata',113,...
				 'YData',727,...
				 'marker','o',...    % sam2
				 'MarkerSize',15,...
				 'markeredgecolor','black',...
				 'markerfacecolor','r');
                  set(handles.opis2,'string','Probka dostala sie do SAM2');
                  pause(handles.n*3)
                  set(handles.sam2,'BackgroundColor','default');
                  set(handles.opis2,'string','');
                  handles.order = 8; 
              elseif cel == 3 % chemin
                  set(handles.chemin,'BackgroundColor','green');
				  hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
				 'Xdata',186,...
				 'YData',727,...
				 'marker','o',...    % chemin
				 'MarkerSize',15,...
				 'markeredgecolor','black',...
				 'markerfacecolor','r');
                  set(handles.opis2,'string','Probka dostala sie do CHEMIN');
                  pause(handles.n*3)
                  set(handles.chemin,'BackgroundColor','default');
                  set(handles.opis2,'string','');
                  handles.order = 8; 
              else % tacka
                  set(handles.tacka,'BackgroundColor','green');
				  hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
				  'Xdata',260,...
				  'YData',727,...
				  'marker','o',...    % tacka
				  'MarkerSize',15,...
				  'markeredgecolor','black',...
				  'markerfacecolor','r');
                  set(handles.opis2,'string','Probka dostala sie do tacki obserwacyjnej');
                  pause(handles.n*3)
                  set(handles.tacka,'BackgroundColor','default');
                  set(handles.opis2,'string','');
                  handles.order = 8; 
              end
              guidata(hObject, handles);
        case 8
              set(handles.opis2,'string','System zakonczyl dzialanie');
              pause(handles.n*2)
              set(handles.opis2,'string','');
              break;
    end
end
set(handles.start,'BackgroundColor','default');
set(handles.manual,'Value',0)
set(handles.start,'Enable','on')
set(handles.manual,'Enable','on')

guidata(hObject, handles);

function manualny_Callback(hObject, eventdata, handles)
% hObject    handle to manualny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject,'Value') == 1 % 1/0 when pressed
    set(handles.start,'BackgroundColor','default');
    set(handles.start,'Enable','on')
    set(handles.manual,'Enable','on')
end
% --- Executes on button press in manual.
function manual_Callback(hObject, eventdata, handles)
% hObject    handle to manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of manual

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.manual = 1;
else
	handles.manual = 0;
end
guidata(hObject, handles);


% --- Executes on button press in awaria.
function awaria_Callback(hObject, eventdata, handles)
% hObject    handle to awaria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in moduly.
function moduly_Callback(hObject, eventdata, handles)
% hObject    handle to moduly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns moduly contents as cell array
%        contents{get(hObject,'Value')} returns selected item from moduly


% --- Executes during object creation, after setting all properties.
function moduly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to moduly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in lyzka.
function lyzka_Callback(hObject, eventdata, handles)
% hObject    handle to lyzka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in wibracje.
function wibracje_Callback(hObject, eventdata, handles)
% hObject    handle to wibracje (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rozdrabniacz.
function rozdrabniacz_Callback(hObject, eventdata, handles)
% hObject    handle to rozdrabniacz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in porcjowanie.
function porcjowanie_Callback(hObject, eventdata, handles)
% hObject    handle to porcjowanie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in tacka.
function tacka_Callback(hObject, eventdata, handles)
% hObject    handle to tacka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in chemin.
function chemin_Callback(hObject, eventdata, handles)
% hObject    handle to chemin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sam1.
function sam1_Callback(hObject, eventdata, handles)
% hObject    handle to sam1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in sam2.
function sam2_Callback(hObject, eventdata, handles)
% hObject    handle to sam2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in przemieszczanie.
function przemieszczanie_Callback(hObject, eventdata, handles)
% hObject    handle to przemieszczanie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in zamknij.
function zamknij_Callback(hObject, eventdata, handles)
% hObject    handle to zamknij (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tytul = 'Pytanie:';
wynik = questdlg('Na pewno chcesz opuscic program?',tytul,'Tak','Nie','Nie');
if strcmp(wynik,'Tak')
   close(gcf);
end;

% --- Executes on button press in manual1.
function manual1_Callback(hObject, eventdata, handles)
% hObject    handle to manual1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Manualne wybieranie przebiego probki po ukladzie

set(handles.manual1,'BackgroundColor','green');
set(handles.manual1,'Enable','off');
set(handles.manual,'Enable','off');
set(handles.start,'Enable','off');

handles.cel = menu('Wybierz cel pr�bki','SAM1','SAM2','CHEMIN','TACKA');
while 1
	if handles.cel == 1 || handles.cel == 2 || handles.cel == 3 || handles.cel == 4
		break;
	else
		handles.cel = menu('Wybierz cel probki','SAM1','SAM2','CHEMIN','TACKA');
	end
end
if handles.cel == 3 || handles.cel == 4
	handles.sito = 2;
else
	handles.sito = menu('Wybierz rozmiar probki','Sito 1mm','Sito 150 mikro metrow');                 
		while 1
			if handles.sito == 1 || handles.sito == 2
				break;
			else
				handles.sito = menu('Wybierz rozmiar pr�bki','Sito 1mm','Sito 150 mikro metrow'); 
			end     
		end
end
	handles.wl = menu('Wybierz �r�d�o pr�bki','�y�ka','Wiert�o'); 
		while 1
			if handles.wl == 1 || handles.wl == 2
				break;
			else
				handles.wl = menu('Wybierz �r�d�o pr�bki','�y�ka','Wiert�o'); 
			end     
		end  
		
set(handles.opcjap,'Enable','on');

guidata(hObject, handles);

% --- Executes on button press in opcjap.
function opcjap_Callback(hObject, eventdata, handles)
% hObject    handle to opcjap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.opcjap,'Enable','off');
set(handles.opis2,'string','System przygotowany do startu');
set(handles.opcjap,'Enable','on');
set(handles.opcja1,'Enable','on');
guidata(hObject, handles);

% --- Executes on button press in opcja1.
function opcja1_Callback(hObject, eventdata, handles)
% hObject    handle to opcja1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.opcjap,'Enable','off');
set(handles.opcja1,'Enable','off');

set(handles.opis2,'string','');
if handles.wl == 1% Lyzka
	set(handles.lyzka,'BackgroundColor','green');
	hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
	'Xdata',280,...
	'YData',600,...
	'marker','o',...    % lyzka
	'MarkerSize',15,...
	'markeredgecolor','black',...
	'markerfacecolor','r');
	set(handles.opis2,'string','Pobieranie materia�u �y�k� z pod�o�a');
	pause(handles.n*3)
	if rand <= 0.3 % awaria lyzki
		set(handles.opis2,'string','');
		set(handles.awaria,'BackgroundColor','red');
		set(handles.opis,'string','�y�ka nie mo�e pobra� materia�u!');
		pause(handles.n*1)
		set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi ponowne pobranie materialu');
		set(handles.opis2,'string','Pobieranie materia�u �y�k� z pod�o�a');
		handles.probkilyzka = xlsread('probkilyzka.xls'); % pobieranie danych
		handles.probkalyzka = randsample(handles.probkilyzka,1);
		pause(handles.n*3)
		set(handles.awaria,'BackgroundColor','default');
		set(handles.opis,'string','');
		set(handles.rozwiazanie,'string','');
		set(handles.lyzka,'BackgroundColor','default');
		set(handles.opis2,'string','');
	else
		handles.probkilyzka = xlsread('probkilyzka.xls'); % pobieranie danych
		handles.probkalyzka = randsample(handles.probkilyzka,1);
		set(handles.lyzka,'BackgroundColor','default');
		set(handles.opis2,'string','');
	end
	set(handles.opis2,'string','SUKCES!');
	set(handles.opis3,'string',handles.probkalyzka);
	pause(handles.n*1)
	set(handles.opis2,'string','');
else % Wiertlo
	hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
	'Xdata',180,...
	'YData',110,...
	'marker','o',...    % wiertlo
	'MarkerSize',15,...
	'markeredgecolor','black',...
	'markerfacecolor','r');
	set(handles.opis2,'string','Pobieranie probki od wiertla');
	handles.probkiwiertlo = xlsread('probkiwiertlo.xls'); % pobieranie danych
	handles.probkawiertlo = randsample(handles.probkiwiertlo,1);
	pause(handles.n*2)
	set(handles.opis2,'string','SUKCES!');
	set(handles.opis3,'string',handles.probkawiertlo);
end

if handles.was == 0;
	set(handles.opcjap,'Enable','on');
else
	handles.was1 = 1;
end
set(handles.opcja1,'Enable','on');
set(handles.opcja2,'Enable','on');
guidata(hObject, handles);

% --- Executes on button press in opcja2.
function opcja2_Callback(hObject, eventdata, handles)
% hObject    handle to opcja3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.opcjap,'Enable','off');
set(handles.opcja1,'Enable','off');
set(handles.opcja2,'Enable','off');

set(handles.wibracje,'BackgroundColor','green');
set(handles.przemieszczanie,'BackgroundColor','green');
ocal = findobj(gcf,'Tag','Marker'); 
hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...    % przemieszczenie
'MarkerSize',15,...
'markerfacecolor','r');
set(handles.opis2,'string','Transportowanie probki do filtracji');
pause(handles.n*2)
if handles.wl == 1
	if handles.probkalyzka >= 1
		set(handles.awaria,'BackgroundColor','red');
		set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mie�ci si� w kanale transportowym.');
		pause(handles.n*1)
		set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi usuni�cie pr�bki i pobranie na nowo.');
		pause(handles.n*3)
		set(handles.awaria,'BackgroundColor','default');
		set(handles.wibracje,'BackgroundColor','default');
		set(handles.przemieszczanie,'BackgroundColor','default');
		set(handles.opis,'string','');
		set(handles.opis2,'string','');
		set(handles.rozwiazanie,'string','');
		% Pobieranie na nowo
		set(handles.lyzka,'BackgroundColor','green');
		hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
		'Xdata',280,...
		'YData',600,...
		'marker','o',...    % lyzka
		'MarkerSize',15,...
		'markeredgecolor','black',...
		'markerfacecolor','r');				
		set(handles.opis2,'string','Pobieranie materia�u �y�k� z pod�o�a');
		handles.probkilyzka = xlsread('probkilyzka.xls','A1:A100'); % pobieranie danych / awaria
		handles.probkalyzka = randsample(handles.probkilyzka,1);
		set(handles.opis3,'string',handles.probkalyzka);
		pause(handles.n*3)
		set(handles.lyzka,'BackgroundColor','default');
		set(handles.opis2,'string','SUKCES!');
		pause(handles.n*1)
		set(handles.opis2,'string','');
		set(handles.wibracje,'BackgroundColor','green');
		set(handles.przemieszczanie,'BackgroundColor','green');
		hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
		'marker','*',...    % przemieszczenie
		'MarkerSize',15,...
		'markerfacecolor','r');
		set(handles.opis2,'string','Transportowanie probki do filtracji');
		pause(handles.n*2)
	end
end
set(handles.wibracje,'BackgroundColor','default');
set(handles.przemieszczanie,'BackgroundColor','default');
set(handles.opis2,'string','SUKCES!');
pause(handles.n*1)
set(handles.opis2,'string','');

if handles.was1 == 0;
	set(handles.opcja1,'Enable','on');
else
	handles.was2 = 1;
	set(handles.opcjap,'Enable','off');
end
set(handles.opcja2,'Enable','on');
set(handles.opcja3,'Enable','on');

guidata(hObject, handles);

% --- Executes on button press in opcja3.
function opcja3_Callback(hObject, eventdata, handles)
% hObject    handle to opcja2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.opcja1,'Enable','off');
set(handles.opcja2,'Enable','off');
set(handles.opcja3,'Enable','off');

            if handles.sito == 1 % Sito1mm
                set(handles.opis2,'string','Przesiewanie probki przez sito 1mm');
				hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
                'Xdata',320,...
                'YData',400,...
                'marker','o',...    % sito
                'MarkerSize',15,...
                'markeredgecolor','black',...
                'markerfacecolor','r');
                pause(handles.n*3)
				if handles.wl == 1
					 if handles.probkalyzka >= 1
						set(handles.opis2,'string','');
						set(handles.awaria,'BackgroundColor','red');
						set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mozna przesiac przez sito.');
						pause(handles.n*1)
						set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi przekazanie probki do rozdrabniania.');
						pause(handles.n*3)
						set(handles.awaria,'BackgroundColor','default');
						set(handles.opis,'string','');
						set(handles.rozwiazanie,'string','');
						set(handles.rozdrabniacz,'BackgroundColor','green');
						hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
						'Xdata',400,...
						'YData',230,...
						'marker','o',...    % rozdrabnianie
						'MarkerSize',15,...
						'markeredgecolor','black',...
						'markerfacecolor','r');
						set(handles.opis2,'string','Rozdrabnianie probki');
						handles.probkilyzka = xlsread('probkilyzka.xls','A1:A150'); % pobieranie danych / rozdrabnianie
						handles.probkalyzka = randsample(handles.probkilyzka,1);
						pause(handles.n*2)
						set(handles.opis3,'string',handles.probkalyzka)
						set(handles.rozdrabniacz,'BackgroundColor','default');			
					 end
				end
					set(handles.opis2,'string','SUKCES!');
					pause(handles.n*1)
					set(handles.opis2,'string','');
            else % Sito150 mikro metrow
                 set(handles.opis2,'string','Przesiewanie probki przez sito 150 mikro metrow');
				 hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
                 'Xdata',320,...
                 'YData',400,...
                 'marker','o',...    % sito
                 'MarkerSize',15,...
                 'markeredgecolor','black',...
                 'markerfacecolor','r');
                 pause(handles.n*3)
				 if handles.wl == 2
					if handles.probkawiertlo >= 0.00015
						  set(handles.opis2,'string','');
						  set(handles.awaria,'BackgroundColor','red');
						  set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mozna przesiac przez sito.');
						  pause(handles.n*1)
						  set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi przekazanie probki do rozdrabniania.');
						  pause(handles.n*3)
						  set(handles.awaria,'BackgroundColor','default');
						  set(handles.opis,'string','');
						  set(handles.rozwiazanie,'string','');
						  set(handles.rozdrabniacz,'BackgroundColor','green');
						  hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
						 'Xdata',400,...
						 'YData',230,...
						 'marker','o',...    % rozdrabnianie
						 'MarkerSize',15,...
						 'markeredgecolor','black',...
						 'markerfacecolor','r');
						  set(handles.opis2,'string','Rozdrabnianie probki');
						  handles.probkiwiertlo = xlsread('probkiwiertlo.xls','A1:A150'); % pobieranie danych / rozdrabnianie
						  handles.probkawiertlo = randsample(handles.probkiwiertlo,1);
						  pause(handles.n*2)
						  set(handles.opis3,'string',handles.probkawiertlo)
					end
				 end
                      set(handles.rozdrabniacz,'BackgroundColor','default');
                      set(handles.opis2,'string','SUKCES!');
                      pause(handles.n*1)
                      set(handles.opis2,'string','');
			end
if handles.was2 == 0;
	set(handles.opcja2,'Enable','on');
else
	handles.was3 = 1;
	set(handles.opcjap,'Enable','off');
	set(handles.opcja1,'Enable','off');
end
set(handles.opcja3,'Enable','on');
set(handles.opcja4,'Enable','on');
guidata(hObject, handles);

% --- Executes on button press in opcja4.
function opcja4_Callback(hObject, eventdata, handles)
% hObject    handle to opcja4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


set(handles.opcja2,'Enable','off');
set(handles.opcja3,'Enable','off');
set(handles.opcja4,'Enable','off');

set(handles.wibracje,'BackgroundColor','green');
set(handles.przemieszczanie,'BackgroundColor','green');
hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
'marker','*',...    % przemieszczenie
'MarkerSize',15,...
'markerfacecolor','r');
set(handles.opis2,'string','Transportowanie probki do formowania');
pause(handles.n*3)
set(handles.wibracje,'BackgroundColor','default');
set(handles.przemieszczanie,'BackgroundColor','default');
set(handles.opis2,'string','');
set(handles.opis2,'string','SUKCES!');
pause(handles.n*1)
set(handles.opis2,'string','');

if handles.was3 == 0;
	set(handles.opcja3,'Enable','on');
else
	handles.was4 = 1;
end
set(handles.opcja4,'Enable','on');
set(handles.opcja5,'Enable','on');
guidata(hObject, handles);

% --- Executes on button press in opcja5.
function opcja5_Callback(hObject, eventdata, handles)
% hObject    handle to opcja5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.opcja3,'Enable','off');
set(handles.opcja4,'Enable','off');
set(handles.opcja5,'Enable','off');

set(handles.porcjowanie,'BackgroundColor','green');
hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
'Xdata',480,...
'YData',600,...
'marker','o',...    % porcjowanie
'MarkerSize',15,...
'markeredgecolor','black',...
'markerfacecolor','r');
set(handles.opis2,'string','Formowanie porcji w celu dalszego transportu do celu');
pause(handles.n*3)
if rand <= 0.5
	set(handles.opis2,'string','');
	set(handles.awaria,'BackgroundColor','red');
	set(handles.opis,'string','Nast�pi� b��d przy formowaniu porcji z pr�bki.');
	pause(handles.n*1)
	set(handles.rozwiazanie,'string','W przeciagu kilku sekund nastapi kolejna pr�ba formowania pr�bki.');
	pause(handles.n*3)
	set(handles.awaria,'BackgroundColor','default');
	set(handles.opis,'string','');
	set(handles.rozwiazanie,'string','');
	set(handles.opis2,'string','Formowanie porcji w celu dalszego transportu do celu');
	set(handles.porcjowanie,'BackgroundColor','green');
	pause(handles.n*3)
	set(handles.porcjowanie,'BackgroundColor','default');
	set(handles.opis2,'string','SUKCES!');
	pause(handles.n*1)
	set(handles.opis2,'string','');
else
	set(handles.porcjowanie,'BackgroundColor','default');
	set(handles.opis2,'string','SUKCES!');
	pause(handles.n*1)
	set(handles.opis2,'string','');
end

if handles.was4 == 0;
	set(handles.opcja4,'Enable','on');
else
	handles.was5 = 1;
	set(handles.opcjap,'Enable','off');
	set(handles.opcja1,'Enable','off');
	set(handles.opcja2,'Enable','off');
end
set(handles.opcja5,'Enable','on');
set(handles.opcja6,'Enable','on');

guidata(hObject, handles);

% --- Executes on button press in opcja6.
function opcja6_Callback(hObject, eventdata, handles)
% hObject    handle to opcja6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.opcja4,'Enable','off');
set(handles.opcja5,'Enable','off');
set(handles.opcja6,'Enable','off');

if handles.cel == 1 % Sam1
	set(handles.sam1,'BackgroundColor','green');
	hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
	'Xdata',38,...
	'YData',727,...
	'marker','o',...    % sam1
	'MarkerSize',15,...
	'markeredgecolor','black',...
	'markerfacecolor','r');
	set(handles.opis2,'string','Probka dostala sie do SAM1');
	pause(handles.n*3)
	set(handles.sam1,'BackgroundColor','default');
	set(handles.opis2,'string','');
elseif handles.cel == 2 % Sam2
	set(handles.sam2,'BackgroundColor','green');
	hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
	'Xdata',113,...
	'YData',727,...
	'marker','o',...    % sam2
	'MarkerSize',15,...
	'markeredgecolor','black',...
	'markerfacecolor','r');
	set(handles.opis2,'string','Probka dostala sie do SAM2');
	pause(handles.n*3)
	set(handles.sam2,'BackgroundColor','default');
	set(handles.opis2,'string','');
elseif handles.cel == 3 % chemin
	set(handles.chemin,'BackgroundColor','green');
	hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
	'Xdata',186,...
	'YData',727,...
	'marker','o',...    % chemin
	'MarkerSize',15,...
	'markeredgecolor','black',...
	'markerfacecolor','r');
	set(handles.opis2,'string','Probka dostala sie do CHEMIN');
	pause(handles.n*3)
	set(handles.chemin,'BackgroundColor','default');
	set(handles.opis2,'string','');
else % tacka
	set(handles.tacka,'BackgroundColor','green');
	hMarker_local = findobj(gcf,'Tag','Marker'); set(hMarker_local,...
	'Xdata',260,...
	'YData',727,...
	'marker','o',...    % tacka
	'MarkerSize',15,...
	'markeredgecolor','black',...
	'markerfacecolor','r');
	set(handles.opis2,'string','Probka dostala sie do tacki obserwacyjnej');
	pause(handles.n*3)
	set(handles.tacka,'BackgroundColor','default');
	set(handles.opis2,'string','');
end
if handles.was5 == 0;
	set(handles.opcja5,'Enable','on');
else
	handles.was6 = 1;
	set(handles.opcjap,'Enable','off');
	set(handles.opcja1,'Enable','off');
	set(handles.opcja2,'Enable','off');
	set(handles.opcja3,'Enable','off');
end
set(handles.opcja6,'Enable','on');
set(handles.opcjak,'Enable','on');
guidata(hObject, handles);

% --- Executes on button press in opcjak.
function opcjak_Callback(hObject, eventdata, handles)
% hObject    handle to opcjak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.opcja5,'Enable','off');
set(handles.opcja6,'Enable','off');

set(handles.opis2,'string','System zakonczyl dzialanie');
pause(handles.n*2)

set(handles.manual1,'BackgroundColor','default');
set(handles.opcjap,'Enable','off');
set(handles.opcja1,'Enable','off');
set(handles.opcja2,'Enable','off');
set(handles.opcja3,'Enable','off');
set(handles.opcja4,'Enable','off');
set(handles.opcja5,'Enable','off');
set(handles.opcja6,'Enable','off');
set(handles.opcjak,'Enable','off');
set(handles.manual,'Enable','on');
set(handles.start,'Enable','on');
set(handles.manual1,'Enable','on');

guidata(hObject, handles);


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tytul = 'Pytanie:';
wynik = questdlg('Na pewno chcesz opuscic program?',tytul,'Tak','Nie','Nie');
if strcmp(wynik,'Tak')
   close(gcf);
end;

guidata(hObject, handles)

% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox({' Curiosity CHIMRA GUI',' Version BETA 1.0  (19/01/14)','',...
       ' by Rafa� Olszewski  <rafello999@gmail.com>'},'About');

guidata(hObject, handles)


% --------------------------------------------------------------------
function github_Callback(hObject, eventdata, handles)
% hObject    handle to github (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox({' Curiosity CHIMRA GUI',' Version BETA 1.0 ','',...
       '  https://github.com/T8kme/Curiosity/'},'GitHub');

guidata(hObject, handles)
