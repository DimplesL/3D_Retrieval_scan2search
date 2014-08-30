clc
clear
close all

input = [0
0.000405647
0.00113581
0.00243388
0.0047055
0.00657147
0.00689599
0.0128996
0.0109525
0.000567905
0.000243388
0.0563849
0.215398
0.131592
0.0462437
0.0548434
0.0654714
0.0454324
0.0498134
0.048921
0.0348045
0.0443777
0.0129807
0.0107902
0.0152523
0.0155768
0.0241765
0.0654714
0.0148467
0.000811293
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
];


database_data = [0
0.000336134
0.0010084
0.00142857
0.00302521
0.00529412
0.00579832
0.0129412
0.0120168
0.00109244
8.40336e-005
0.0534454
0.221681
0.13521
0.0429412
0.0605042
0.0632773
0.0445378
0.0372269
0.0647899
0.0357983
0.0442857
0.0133613
0.00983193
0.0155462
0.0141176
0.0254622
0.0610924
0.0138655
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
];


figure,
bar(input);set(gca, 'XLim', [0.0 35.0]);%view([90,-30,60]);set(gcf,'renderer','zbuffer'); %set(gca, 'ZLim', [0.0 600000.0]);
set (gcf,'Position',[400,200,350,262], 'color','w')
%title('Distance Histogram Descriptors of The Rotated Model'); 
xlabel('Distance'); ylabel('Frequency');
figure,
bar(database_data);set(gca, 'XLim', [0.0 35.0]);%view([90,-30,60]);set(gcf,'renderer','zbuffer');  %set(gca, 'ZLim', [0.0 600000.0]);
set (gcf,'Position',[400,200,350,262], 'color','w')
%title('Distance Histogram Descriptors of The Origin Model'); 
xlabel('Distance'); ylabel('Frequency');

