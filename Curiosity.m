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
%      reset.  All inputs are passed to Curiosity_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Curiosity

% Last Modified by GUIDE v2.5 18-Jan-2015 00:33:43

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
imshow('pia16207-43.jpg')
handles.n=1; % wspolczynnik czasu
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Curiosity_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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
	cel = menu('Wybierz cel próbki','SAM1','SAM2','CHEMIN','TACKA');
	while 1
		if cel == 1 || cel == 2 || cel == 3 || cel == 4
			break;
		else
		   cel = menu('Wybierz cel próbki','SAM1','SAM2','CHEMIN','TACKA');
		end
	end
	if cel == 3 || cel == 4
		sito = 2;
	else
		sito = menu('Wybierz rozmiar próbki','Sito 1mm','Sito 150 mikro metrow');                 
			while 1
				if sito == 1 || sito == 2
					break;
				else
					sito = menu('Wybierz rozmiar próbki','Sito 1mm','Sito 150 mikro metrow'); 
				end     
			end
	end
		wl = menu('Wybierz Ÿród³o próbki','£y¿ka','Wiert³o'); 
			while 1
				if wl == 1 || wl == 2
					break;
				else
					wl = menu('Wybierz Ÿród³o próbki','£y¿ka','Wiert³o'); 
				end     
			end  
else 
    % tryb automatyczny
    set(handles.manual,'Enable','off')
    set(handles.slider1,'Enable','off')
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
        set(handles.opis2,'string','Jako cel automatycznie obrano tackê obserwacyjn¹');
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
                wl = fix(rand*2+1); %'£y¿ka','Wiert³o')
				if wl == 1
					set(handles.opis2,'string','Jako Ÿród³o próbki automatycznie obrano ³y¿kê');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
				else
					set(handles.opis2,'string','Jako Ÿród³o próbki automatycznie obrano wyjœcie od wiert³a');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
				end
            else
				set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 1mm');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                wl == 1;
            end
        case 2
            sito = fix(rand*2+1); %'Sito 1mm','Sito 150 mikro metrow');
            if sito == 2
				set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 150 mikro metrow');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                wl = fix(rand*2+1); %'£y¿ka','Wiert³o')
				if wl == 1
					set(handles.opis2,'string','Jako Ÿród³o próbki automatycznie obrano ³y¿kê');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
				else
					set(handles.opis2,'string','Jako Ÿród³o próbki automatycznie obrano wyjœcie od wiert³a');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
				end
            else
				set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 1mm');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                wl == 1;
            end
        case 3
            sito == 2;
            wl = fix(rand*2+1) %'£y¿ka','Wiert³o');
            if wl == 1
                set(handles.opis2,'string','Jako Ÿród³o próbki automatycznie obrano ³y¿kê');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            else
                set(handles.opis2,'string','Jako Ÿród³o próbki automatycznie obrano wyjœcie od wiert³a');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            end            
        case 4
		    sito = fix(rand*2+1) %'Sito 1mm','Sito 150 mikro metrow');   
            if sito == 1
                set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 1mm');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            else 
                set(handles.opis2,'string','Jako rozmiar probki automatycznie obrano Sito 150 mikro metrow');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            end
            wl = fix(rand*2+1) %'£y¿ka','Wiert³o');         
            if wl == 1
                set(handles.opis2,'string','Jako Ÿród³o próbki automatycznie obrano ³y¿kê');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            else
                set(handles.opis2,'string','Jako Ÿród³o próbki automatycznie obrano wyjœcie od wiert³a');
                pause(handles.n*1)
                set(handles.opis2,'string','');
            end
    end    
end
order = 0;
while 1
    switch order
        case 0 % Przygotowanie komponentow
            order = 1;
            set(handles.opis2,'string','System przygotowany do startu');
            pause(handles.n*2)
            set(handles.opis2,'string','');
        case 1 
            if wl == 1% Lyzka
                set(handles.lyzka,'BackgroundColor','green');
                set(handles.opis2,'string','Pobieranie materia³u ³y¿k¹ z pod³o¿a');
                pause(handles.n*3)
                if rand <= 0.2
                    set(handles.opis2,'string','');
                    set(handles.awaria,'BackgroundColor','red');
                    set(handles.opis,'string','£y¿ka nie mo¿e pobraæ materia³u!');
                    pause(handles.n*1)
                    set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi ponowne pobranie materialu');
                    set(handles.opis2,'string','Pobieranie materia³u ³y¿k¹ z pod³o¿a');
                    pause(handles.n*3)
                    set(handles.awaria,'BackgroundColor','default');
                    set(handles.opis,'string','');
                    set(handles.rozwiazanie,'string','');
                    set(handles.lyzka,'BackgroundColor','default');
                    set(handles.opis2,'string','');
                else
                    set(handles.lyzka,'BackgroundColor','default');
                    set(handles.opis2,'string','');
                end
                set(handles.opis2,'string','SUKCES!');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                order = 2;
            else % Wiertlo
                set(handles.opis2,'string','Pobieranie probki od wiertla');
                %pobieranie danych xD
                pause(handles.n*3)
                set(handles.opis2,'string','SUKCES!');
                order = 2;
            end
        case 2 % Przemieszenie
             set(handles.wibracje,'BackgroundColor','green');
             set(handles.przemieszczanie,'BackgroundColor','green');
             set(handles.opis2,'string','Transportowanie probki do filtracji');
             pause(handles.n*3)
             if rand <= 0.2
                set(handles.awaria,'BackgroundColor','red');
                set(handles.opis,'string','Próbka jest zbyt du¿a. Nie mieœci siê w kanale transportowym.');
                pause(handles.n*1)
                set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi usuniêcie próbki i pobranie na nowo.');
                pause(handles.n*3)
                set(handles.awaria,'BackgroundColor','default');
                set(handles.wibracje,'BackgroundColor','default');
                set(handles.przemieszczanie,'BackgroundColor','default');
                set(handles.opis,'string','');
                set(handles.opis2,'string','');
                set(handles.rozwiazanie,'string','');
                % Pobieranie na nowo
                if wl == 1% Lyzka
                    set(handles.lyzka,'BackgroundColor','green');
                    set(handles.opis2,'string','Pobieranie materia³u ³y¿k¹ z pod³o¿a');
                    pause(handles.n*3)
                    set(handles.lyzka,'BackgroundColor','default');
                    set(handles.opis2,'string','SUKCES!');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
                    order = 2;
                else
                    set(handles.opis2,'string','Pobieranie probki od wiertla');
                    %pobieranie danych xD
                    pause(handles.n*3)
                    set(handles.opis2,'string','SUKCES!');
                    order = 2;
                end
            else
                set(handles.wibracje,'BackgroundColor','default');
                set(handles.przemieszczanie,'BackgroundColor','default');
                set(handles.opis2,'string','SUKCES!');
                pause(handles.n*1)
                set(handles.opis2,'string','');
                order = 3;
            end
        case 3 % Sito1mm
            if sito == 1
                set(handles.rozdrabniacz,'BackgroundColor','green');
                set(handles.opis2,'string','Przesiewanie probki przez sito 1mm');
                pause(handles.n*3)
                 if rand <= 0.2
                    set(handles.opis2,'string','');
                    set(handles.awaria,'BackgroundColor','red');
                    set(handles.opis,'string','Próbka jest zbyt du¿a. Nie mozna przesiac przez sito.');
                    pause(handles.n*1)
                    set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi przekazanie probki do rozdrabniania.');
                    pause(handles.n*3)
                    set(handles.awaria,'BackgroundColor','default');
                    set(handles.opis,'string','');
                    set(handles.rozwiazanie,'string','');
                    set(handles.rozdrabniacz,'BackgroundColor','green');
                    set(handles.opis2,'string','Rozdrabnianie probki');
                    pause(handles.n*3)
                    set(handles.rozdrabniacz,'BackgroundColor','default');
                    set(handles.opis2,'string','SUKCES!');
                    pause(handles.n*1)
                    set(handles.opis2,'string','');
                 end
                 set(handles.rozdrabniacz,'BackgroundColor','default');
                 set(handles.opis2,'string','SUKCES!');
                 pause(handles.n*1)
                 set(handles.opis2,'string','');
                 order = 4;
            else % Sito150 mikro metrow
                 set(handles.rozdrabniacz,'BackgroundColor','green');
                 set(handles.opis2,'string','Przesiewanie probki przez sito 150 mikro metrow');
                 pause(handles.n*3)
                   if rand <= 0.2
                      set(handles.opis2,'string','');
                      set(handles.awaria,'BackgroundColor','red');
                      set(handles.opis,'string','Próbka jest zbyt du¿a. Nie mozna przesiac przez sito.');
                      pause(handles.n*1)
                      set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi przekazanie probki do rozdrabniania.');
                      pause(handles.n*3)
                      set(handles.awaria,'BackgroundColor','default');
                      set(handles.opis,'string','');
                      set(handles.rozwiazanie,'string','');
                      set(handles.rozdrabniacz,'BackgroundColor','green');
                      set(handles.opis2,'string','Rozdrabnianie probki');
                      pause(handles.n*3)
                      set(handles.rozdrabniacz,'BackgroundColor','default');
                      set(handles.opis2,'string','SUKCES!');
                      pause(handles.n*1)
                      set(handles.opis2,'string','');
                   else
                       set(handles.rozdrabniacz,'BackgroundColor','default');
                       set(handles.opis2,'string','SUKCES!');
                       pause(handles.n*1)
                       set(handles.opis2,'string','');
                   end
                   order = 4;
            end
        case 4 % Przemieszczenie
              set(handles.wibracje,'BackgroundColor','green');
              set(handles.przemieszczanie,'BackgroundColor','green');
              set(handles.opis2,'string','Transportowanie probki do formowania');
              pause(handles.n*3)
              set(handles.wibracje,'BackgroundColor','default');
              set(handles.przemieszczanie,'BackgroundColor','default');
              set(handles.opis2,'string','');
              set(handles.opis2,'string','SUKCES!');
              pause(handles.n*1)
              set(handles.opis2,'string','');
              order = 5;
        case 5 % Formowanie porcji
              set(handles.porcjowanie,'BackgroundColor','green');
              set(handles.opis2,'string','Formowanie porcji w celu dalszego transportu do celu');
              pause(handles.n*3)
              if rand <= 0.2
                  set(handles.opis2,'string','');
                  set(handles.awaria,'BackgroundColor','red');
                  set(handles.opis,'string','Nast¹pi³ b³¹d przy formowaniu porcji z próbki.');
                  pause(handles.n*1)
                  set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi kolejna próba formowania próbki.');
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
              order = 6;
        case 6 % Przemieszczenie
              set(handles.wibracje,'BackgroundColor','green');
              set(handles.przemieszczanie,'BackgroundColor','green');
              set(handles.opis2,'string','Transportowanie probki do celu');
              pause(handles.n*3)
              set(handles.wibracje,'BackgroundColor','default');
              set(handles.przemieszczanie,'BackgroundColor','default');
              set(handles.opis2,'string','SUKCES!');
              pause(handles.n*1)
              set(handles.opis2,'string','');
              order = 7;
        case 7 %cel
              if cel == 1 % Sam1
                  set(handles.sam1,'BackgroundColor','green');
                  set(handles.opis2,'string','Probka dostala sie do SAM1');
                  pause(handles.n*3)
                  set(handles.sam1,'BackgroundColor','default');
                  set(handles.opis2,'string','');
                  order = 8; 
              elseif cel == 2 % Sam2
                  set(handles.sam2,'BackgroundColor','green');
                  set(handles.opis2,'string','Probka dostala sie do SAM2');
                  pause(handles.n*3)
                  set(handles.sam2,'BackgroundColor','default');
                  set(handles.opis2,'string','');
                  order = 8; 
              elseif cel == 3 % chemin
                  set(handles.chemin,'BackgroundColor','green');
                  set(handles.opis2,'string','Probka dostala sie do CHEMIN');
                  pause(handles.n*3)
                  set(handles.chemin,'BackgroundColor','default');
                  set(handles.opis2,'string','');
                  order = 8; 
              else % tacka
                  set(handles.tacka,'BackgroundColor','green');
                  set(handles.opis2,'string','Probka dostala sie do tacki obserwacyjnej');
                  pause(handles.n*3)
                  set(handles.tacka,'BackgroundColor','default');
                  set(handles.opis2,'string','');
                  order = 8; 
              end
        case 8
              set(handles.opis2,'string','System zakonczyl dzialanie');
              pause(handles.n*3)
              set(handles.opis2,'string','');
              break;
    end
end
set(handles.start,'BackgroundColor','default');
set(handles.start,'Enable','on')

function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject,'Value') == 1 % 1/0 when pressed
    set(handles.start,'BackgroundColor','default');
    set(handles.start,'Enable','on')
    set(handles.slider1,'Enable','on')
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

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


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

% --- Executes on key press with focus on reset and none of its controls.
function reset_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

