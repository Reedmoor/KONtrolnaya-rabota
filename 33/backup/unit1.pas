unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    durationEdit: TEdit;
    dayofweekEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DiscountedCostLabel: TLabel;
    TotalCostLabel: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  PRICE_PER_MINUTE: Double = 0.1;
  DISCOUNT: Double = 0.25;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.Button1Click(Sender: TObject);

var
    duration, dayOfWeek: integer; // переменные для хранения длительности разговора и номера дня недели
  totalCost, discountedCost: Double; // переменные для хранения общей стоимости и стоимости со скидкой
begin
  // Вводим длительность разговора и номер дня недели
  duration := StrToInt(DurationEdit.Text);
  dayOfWeek := StrToInt(DayOfWeekEdit.Text);

  // Вычисляем общую стоимость разговора
  totalCost := duration * PRICE_PER_MINUTE;

  // Если день недели - суббота или воскресенье, вычисляем стоимость со скидкой
  if (dayOfWeek = 6) or (dayOfWeek = 7) then
    discountedCost := totalCost * (1 - DISCOUNT)
  else
    discountedCost := totalCost;

  // Выводим результаты
  TotalCostLabel.Caption := 'Общая стоимость разговора: ' + FloatToStr(totalCost) + ' руб.';
  DiscountedCostLabel.Caption := 'Стоимость разговора со скидкой: ' + FloatToStr(discountedCost) + ' руб.';

end;


end.

