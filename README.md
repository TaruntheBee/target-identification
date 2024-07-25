# Target Classification

## Objective
To classify airborne targets as either helicopters or aeroplanes based on given speed and altitude data. A radar is providing three parameters: height, speed, and time. From the given data, we have to identify whether the aircraft is a helicopter or an aeroplane. This report details the methodology, implementation, and results of the classification algorithm using MATLAB.

## Data
The data provided includes:
- **Time**: Measured in minutes.
- **Speed**: Given in knots (kts).
- **Altitude**: Provided in feet (ft).

## Methodology

### Data Conversion
The first step is converting the speed from knots to kilometers per hour (km/h) and the altitude from feet to meters as the formula is for km/h and meters.
- **Speed Conversion**: 
  \[
  \text{Speed (km/h)} = \text{Speed (kts)} \times 1.852
  \]
- **Altitude Conversion**: 
  \[
  \text{Altitude (m)} = \text{Altitude (ft)} \times 0.3048
  \]

### Rate of Climb/Descent (ROCD)
To understand the vertical movement, the rate of climb/descent (ROCD) is calculated between consecutive data points:
\[
\text{ROCD} = \frac{\text{Altitude}(n) - \text{Altitude}(n-1)}{\text{Time}(n) - \text{Time}(n-1)}
\]
We are calculating ROCD to use this data to filter for helicopter and aeroplane.

### Classification Criteria
The classification is based on the following fuzzy logic approach:
- **Helicopter**:
  - Speed < 450 km/h
  - Altitude < 6096 meters
  - ROCD: -3 to 3

- **Aeroplane**:
  - Speed < 1000 km/h
  - Altitude < 13716 meters
  - ROCD: -12 to -3 and 3 to 12

## Results
After running the classification algorithm, the following results were obtained:

### Speed in km/h:
  170.3840  170.3840  166.6800  161.1240  157.4200  151.8640  148.1600  133.3440  107.4160   92.6000   77.7840   61.1160   38.8920   20.3720

### Altitude in meters:
  388.6200  365.7600  342.9000  297.1800  281.9400  259.0800  251.4600  220.9800  220.9800  213.3600  198.1200  190.5000  182.8800  182.8800

### ROCD:
   -4.5720   -4.5720   -9.1440   -3.0480   -4.5720   -1.5240   -6.0960         0   -1.5240   -3.0480   -1.5240   -1.5240         0

### Predicted labels:
     1     1     1     1     1     1     1     1     1     1     1     1     1     1

### Probability of Helicopter: 100%
### Probability of Aeroplane: 0%

## Conclusion
The project successfully demonstrates an algorithm for classifying airborne targets as either helicopters or aeroplanes using fuzzy logic based on speed and altitude data. The results show that all data points could be classified as both helicopter and aeroplane, indicating overlapping criteria. Further refinement of criteria or additional data could improve classification accuracy. The probabilities provide an insight into the likelihood of each class, showing that the current dataset fits both classifications under the given criteria.
