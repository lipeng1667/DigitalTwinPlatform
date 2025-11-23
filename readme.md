# Digital Twin 3D Power Plant System

## Project Overview
This project is a **Digital Twin 3D Power Plant Equipment Monitoring, Diagnosis, and Preventive Maintenance System**. It is designed to visualize power plant equipment in 3D, monitor real-time status, and provide predictive maintenance alerts to improve operational efficiency and safety.

## Key Features
- **3D Visualization**: High-fidelity 3D representation of the power plant (Boiler, Turbine, Generator) with interactive controls (zoom, pan, rotate).
- **Real-time Monitoring**: Integration with simulated SIS/MIS data to display real-time parameters (Temperature, Pressure, Vibration, etc.).
- **Equipment Management**: Detailed view of equipment components (e.g., Superheater, Water Wall) with historical data tracking.
- **Predictive Maintenance**:
  - **Thickness Prediction**: AI-based prediction of pipe thickness reduction.
  - **Life Expectancy**: Estimation of remaining useful life and replacement recommendations.
  - **Alerts**: Visual and system alerts for abnormal conditions.

## Technology Stack
- **Frontend**: React, TypeScript, Vite
- **3D Engine**: Three.js, React Three Fiber, Drei
- **Styling**: Tailwind CSS
- **State Management**: Zustand / Context API
- **Charts**: Recharts / Chart.js

## Project Structure
```
src/
├── components/
│   ├── 3d/           # 3D models and scene components
│   ├── dashboard/    # UI panels and charts
│   └── shared/       # Reusable UI components
├── hooks/            # Custom React hooks
├── store/            # State management
├── utils/            # Helper functions (prediction logic, formatters)
└── assets/           # Static assets (textures, models)
```

## Getting Started

### Prerequisites
- Node.js (v16+)
- npm / yarn

### Installation
1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```

### Running Locally
```bash
npm run dev
```

## License
[License Name]
