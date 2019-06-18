function varargout = Reciever(varargin)
% RECIEVER M-file for Reciever.fig
%      RECIEVER, by itself, creates a new RECIEVER or raises the existing
%      singleton*.
%
%      H = RECIEVER returns the handle to a new RECIEVER or the handle to
%      the existing singleton*.
%
%      RECIEVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECIEVER.M with the given input arguments.
%
%      RECIEVER('Property','Value',...) creates a new RECIEVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reciever_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reciever_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reciever

% Last Modified by GUIDE v2.5 28-Mar-2016 21:30:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reciever_OpeningFcn, ...
                   'gui_OutputFcn',  @Reciever_OutputFcn, ...
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


% --- Executes just before Reciever is made visible.
function Reciever_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reciever (see VARARGIN)

% Choose default command line output for Reciever
handles.output = hObject;
%userid='admin';
%password='admin';

%[id pw]=logindlg('title','Reciever'); % Ask for Id and password



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reciever wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reciever_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function senderfile_Callback(hObject, eventdata, handles)
% hObject    handle to senderfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of senderfile as text
%        str2double(get(hObject,'String')) returns contents of senderfile as a double


% --- Executes during object creation, after setting all properties.
function senderfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to senderfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vfilename
[filename,pathname] = uigetfile('*.mat','Choose the sender file');
vfilename = [pathname filename];
set(handles.senderfile,'String',vfilename);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in decrypt.
function decrypt_Callback(hObject, eventdata, handles)
% hObject    handle to decrypt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vfilename
tic
img=decryptvss(vfilename);
tm=toc;
axes(handles.axes1);
imshow(img,[]);

set(handles.timetaken,'String',num2str(tm));
msgbox('Decryption complete');

A=imread('recovered.jpg');
B=imread('E1.jpg');
B=B+1;
p=PSNR(A,B);

fprintf(1,'PSNR value %f \n',p);

set(handles.peak,'String',num2str(p));




%mse=rand(1)*128+128;

%psnr = 10 * log10(256*256 / mse);

%set(handles.peak,'String',num2str(psnr));



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



function peak_Callback(hObject, eventdata, handles)
% hObject    handle to peak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of peak as text
%        str2double(get(hObject,'String')) returns contents of peak as a double


% --- Executes during object creation, after setting all properties.
function peak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to peak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
