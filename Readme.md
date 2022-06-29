# Sonar Designer

The Sonar Designer is a helpful tool for developers and designers of sonar systems. The software eases the elaborate search for the most workable Piezo materials and dimensions for an optimal sound propagation and signal transmission under water. The tool is suitable for ultrasonic transmitters as well as for receivers or combined data transmission systems.
![Sonar Designer](https://github.com/seanussystems/SonarDesigner/blob/main/Docu/SonarDesigner.jpg)

# Development

SonarDesigner is written in Pascal and has been migrated to Embarcadero Delphi Vers. 10.4.
It needs the following packages:
* KSVC bonus package (Konopka Signature VCL Controls aka Raize Components) vers. 6.1
* DiveCharts (TDepthChart and TPolarChart) vers. 2.0

# Installation

1. add the path '..\SonarDesigner\lib' to the environment variable
2. start Delphi and install the packages 'KSVC_Design.bpl' and 'divecharts_design.bpl'.
3. open the project 'SonarDesigner.dproj' and rebuild it 