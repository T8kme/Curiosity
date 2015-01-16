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
%      stop.  All inputs are passed to Curiosity_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Curiosity

% Last Modified by GUIDE v2.5 16-Jan-2015 20:55:31

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


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in manual.
function manual_Callback(hObject, eventdata, handles)
% hObject    handle to manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of manual


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


