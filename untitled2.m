
function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 01-May-2019 15:22:42

     
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% You can customize and fix initial directory paths
global TrainDatabasePath;
TrainDatabasePath = uigetdir(strcat(matlabroot,'\work'), '选择训练人脸库' );

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDatabasePath;
TestDatabasePath = uigetdir(strcat(matlabroot,'\work'), '选择测试人脸库');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDatabasePath;
global TrainDatabasePath;

%读取人脸库的路径
prompt = {'输入库内测试人脸数字代表'};
dlg_title = 'Input of PCA-Based Face Recognition System';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
temp = TestImage;
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
im = imread(TestImage);

T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces,D] = EigenfaceCore(T);

%画出特征值得图像


global OutputName;
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

%输出测试图片
axes(handles.axes1);
imshow(im);
%输出匹配图片
axes(handles.axes2);
imshow(SelectedImage);
%结果显示名字
season = 'null';
    switch OutputName
        case {'1.jpg','2.jpg'}
        if(char(temp) == '1')
            season='成龙';
        else
            msg = msgbox('未找到账户！');
            season='null';
        end            
        
        case {'3.jpg','4.jpg'}
        if(char(temp) == '2')
            season='胡军';
        else
            msg = msgbox('未找到账户！'); 
            season='null';
        end
        
        case {'5.jpg','6.jpg'}
        if(char(temp) == '3')
            season='张子枫';
        else
            msg = msgbox('未找到账户！');
            season='null';
        end            
            
        case {'7.jpg','8.jpg'}
        if(char(temp) == '4')
            season='庄达菲';
        else
            msg = msgbox('未找到账户！'); 
            season='null';
        end   
        
        case {'9.jpg','10.jpg'}
        if(char(temp) == '5')
            season='李云龙';
        else
            msg = msgbox('未找到账户！'); 
            season='null';
        end
        
        case {'11.jpg','12.jpg'}
        if(char(temp) == '6')
            season='楚云飞';
        else
            msg = msgbox('未找到账户！'); 
            season='null';
        end
        
        case {'13.jpg','14.jpg'}
        if(char(temp) == '7')
            season='科比';   
        else
            msg = msgbox('未找到账户！'); 
            season='null';
        end
        
        case {'15.jpg','16.jpg'}
        if(char(temp) == '8')
            season='Green';
        else
            msg = msgbox('未找到账户！'); 
            season='null';
        end
        
        case {'17.jpg','18.jpg'}
        if(char(temp) == '9')
            season='Jack';
        else
            msg = msgbox('未找到账户！'); 
            season='null';
        end
        
        case {'19.jpg','20.jpg'}
        if(char(temp) == '10')
            season='Tom';
        else
            msg = msgbox('未找到账户！'); 
            season='null';
        end
        
        otherwise
            season='null'
    end
    
str = strcat('库内匹配结果 :  ',OutputName);
set(handles.result,'string',str);

%结果显示图片序号
str = strcat('库内匹配结果 :  ',season);
set(handles.result,'string',str);

%画出特征值得图像
% figure;
% x=1:20;
% D=diag(D);
% y = flipud(D);
% plot(x,y,'.')
% xlabel('数');
% ylabel('特征值大小');

function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double
global OutputName;
axes(handles.result);
str = strcat('Matched image is :  ',OutputName);
set(handles.result,'string',str);

% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
