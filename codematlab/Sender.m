function varargout = Sender(varargin)
% SENDER M-file for Sender.fig
%      SENDER, by itself, creates a new SENDER or raises the existing
%      singleton*.
%
%      H = SENDER returns the handle to a new SENDER or the handle to
%      the existing singleton*.
%
%      SENDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SENDER.M with the given input arguments.
%
%      SENDER('Property','Value',...) creates a new SENDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sender_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sender_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sender

% Last Modified by GUIDE v2.5 02-Apr-2016 18:35:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sender_OpeningFcn, ...
                   'gui_OutputFcn',  @Sender_OutputFcn, ...
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


% --- Executes just before Sender is made visible.
function Sender_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sender (see VARARGIN)

% Choose default command line output for Reciever
handles.output = hObject;
%userid='admin';
%password='admin';

%[id pw]=logindlg('title','Sender');
% li = strcmp ('userid','password');
 
 
 % if li == 1
     

%l = strcmp(userid, password);
%if l == 1
%    [id pw]=logindlg('title','Sender','admin'); % Ask for Id and password
 
%set(handles.edit1, 'String','');
%else    
 %   msgbox('either wrong userid or wrong password');
    %set(handles.edit1, 'String','');
%end

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Reciever wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sender_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function enimage_Callback(hObject, eventdata, handles)
% hObject    handle to enimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enimage as text
%        str2double(get(hObject,'String')) returns contents of enimage as a double


% --- Executes during object creation, after setting all properties.
function enimage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CreateTheEncryptImage.
function CreateTheEncryptImage_Callback(hObject, eventdata, handles)
% hObject    handle to CreateTheEncryptImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vfilename
tic
encrptvss(vfilename);
tm=toc;
set(handles.timetaken,'String',num2str(tm));
%set(handles.timetaken,'String',num2str(tm)+'ms');
msgbox('Encryption complete');

% --- Executes on button press in BrowseTheInputImage.
function BrowseTheInputImage_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseTheInputImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vfilename

[filename,pathname] = uigetfile('*.jpg','Choose the Image to encrypt');
vfilename = [pathname filename];
set(handles.enimage,'String',vfilename);

%set(handles.facetomatch,'String',vfilename); 

inp = imread(vfilename);
axes(handles.axes1);
imshow(inp,[]);



function timetaken_Callback(hObject, eventdata, handles)
% hObject    handle to timetaken (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timetaken as text
%        str2double(get(hObject,'String')) returns contents of timetaken as a double


% --- Executes during object creation, after setting all properties.
function timetaken_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timetaken (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function epsnr_Callback(hObject, eventdata, handles)
% hObject    handle to epsnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsnr as text
%        str2double(get(hObject,'String')) returns contents of epsnr as a double


% --- Executes during object creation, after setting all properties.
function epsnr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
