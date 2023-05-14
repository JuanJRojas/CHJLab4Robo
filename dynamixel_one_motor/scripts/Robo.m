function varargout = Robo(varargin)
if ros.internal.Global.isNodeActive==0
    rosinit;
    startup_rvc;
end
% ROBO MATLAB code for Robo.fig
%      ROBO, by itself, creates a new ROBO or raises the existing
%      singleton*.
%
%      H = ROBO returns the handle to a new ROBO or the handle to
%      the existing singleton*.
%
%      ROBO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBO.M with the given input arguments.
%
%      ROBO('Property','Value',...) creates a new ROBO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Robo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Robo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Robo

% Last Modified by GUIDE v2.5 14-May-2023 09:32:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Robo_OpeningFcn, ...
                   'gui_OutputFcn',  @Robo_OutputFcn, ...
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


% --- Executes just before Robo is made visible.
function Robo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Robo (see VARARGIN)

% Choose default command line output for Robo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Robo wait for user response (see UIRESUME)
% uiwait(handles.figure1);
A = imread ('escudoUnal_black.png');
axes(handles.position);
imagesc(A);


% --- Outputs from this function are returned to the command line.
function varargout = Robo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Plot.
function Plot_Callback(hObject, eventdata, handles)
    
    q1= deg2rad(get(handles.q1,'value'));
    q2= deg2rad(get(handles.q2,'value'));
    q3= deg2rad(get(handles.q3,'value'));
    q4= deg2rad(get(handles.q4,'value'));
    L1 = Link ('revolute', 'd',    138, 'a', 0, 'alpha',  pi/2, 'offset', 0 );
    L2 = Link ('revolute', 'd',    0, 'a', 107, 'alpha',  0, 'offset',  pi/2 );
    L3 = Link ('revolute', 'd',    0, 'a', 108, 'alpha',  0, 'offset',  0 );
    L4 = Link ('revolute', 'd',    0, 'a', 95, 'alpha',  -pi/2, 'offset',  0 );
    L5 = Link ('revolute', 'd',    0, 'a', 0, 'alpha',  0, 'offset',  0 );
    ws = [-300 300 -300 300 -30 600];
    Links=  SerialLink([L1 L2 L3 L4 L5])
    view([180,0])
    Robot1 = SerialLink(Links);
    Robot1.plot([q1 q2 q3 q4 0],'workspace',ws);
    % Utilización de la función hold para superponer la gráfica en el objeto axes específico
    axes(handles.position);
    joint_publisher(q1,q2,q3,q4)
   
% --- Executes on slider movement.
function q2_Callback(hObject, eventdata, handles)
%  Hints: get(hObject,'Value') returns position of slider
%         get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function q2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q3_Callback(hObject, eventdata, handles)
% hObject    handle to q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function q3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q4_Callback(hObject, eventdata, handles)
% hObject    handle to q4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function q4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q1_Callback(hObject, eventdata, handles)
% hObject    handle to q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function q1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.q1,'value',0);
set(handles.q2,'value',0);
set(handles.q3,'value',0);
set(handles.q4,'value',0);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.q1,'value',-25);
set(handles.q2,'value',15);
set(handles.q3,'value',-20);
set(handles.q4,'value',20);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.q1,'value',35);
set(handles.q2,'value',-35);
set(handles.q3,'value',30);
set(handles.q4,'value',-30);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.q1,'value',-85);
set(handles.q2,'value',20);
set(handles.q3,'value',-55);
set(handles.q4,'value',17);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.q1,'value',-80);
set(handles.q2,'value',35);
set(handles.q3,'value',-55);
set(handles.q4,'value',45);
