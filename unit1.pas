unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, Grids, StdCtrls, ExtCtrls, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3DblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

  cell = record
    x, y: integer;
  end;

var
  Form1: TForm1;
  y1,x1,y,x,y2,x2,y3,x3,y4,x4,y5,x5,y6,x6,y7,x7,y8,x8,y9,x9: integer;
  i: integer;
  lab: string;
  table: array [0..9] of cell;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  Chart1LineSeries1.Clear ;
  Chart1LineSeries1.AddXY(0,0);
  Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[1,0]),StrToFloat(StringGrid1.Cells[1,1]));
  Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[2,0]),StrToFloat(StringGrid1.Cells[2,1]));
  Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[3,0]),StrToFloat(StringGrid1.Cells[3,1]));
  Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[4,0]),StrToFloat(StringGrid1.Cells[4,1]));
  Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[5,0]),StrToFloat(StringGrid1.Cells[6,1]));
  Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[7,0]),StrToFloat(StringGrid1.Cells[7,1]));
  Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[8,0]),StrToFloat(StringGrid1.Cells[8,1]));
  Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[9,0]),StrToFloat(StringGrid1.Cells[9,1]));
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
var s,s1,sr,sr1,otn:real;
  var DG: array [1..9] of real;
begin
     s1:=0;
     s:=0;
     for i:= 1 to 9 do
     begin
       s:=StrToFloat(StringGrid1.Cells[i,1]) + s;
     end;
     sr:=s/9;
     for i:= 1 to 9 do
     begin
       dg[i]:=abs(StrToFloat(StringGrid1.Cells[i,1]) - sr);
       s1:=dg[i] + s1;
     end;
     sr1:=s1/9;
     otn:=(sr1/sr)* 100;
     formatfloat('0.00',otn);
     Edit1.Text:=FloatToStrF(sr, ffFixed, 2,2) + ' ± ' + FloatToStrF(otn, ffFixed, 2,1) ;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  lab := '';
  if InputQuery('Лабораторная', 'Введите номер лабораторной: ' + #13 +
  '1 - График зависимости силы тока от напряжения' + #13 + '2 - Определение Измерительной погрешности', lab) then
  case lab of
     '1':begin
       StringGrid1.Cells[0,0] :='U, В';
       StringGrid1.Cells[0,1] :='I, мА';
     end;
     '2':begin
       StringGrid1.Cells[0,0] :='№ эксперимента';
       StringGrid1.Cells[0,1] :='Измерение';
       StringGrid1.Cells[1,0] :='1';
       StringGrid1.Cells[2,0] :='2';
       StringGrid1.Cells[3,0] :='3';
       StringGrid1.Cells[4,0] :='4';
       StringGrid1.Cells[5,0] :='5';
       StringGrid1.Cells[6,0] :='6';
       StringGrid1.Cells[7,0] :='7';
       StringGrid1.Cells[8,0] :='8';
       StringGrid1.Cells[9,0] :='9';
     end;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label3DblClick(Sender: TObject);
begin
       OpenURL('https://github.com/erudite-individual/FreeTest');
end;



end.

