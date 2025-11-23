## LubiPool Card

A specialized Home Assistant Lovelace card for visualizing swimming pool systems with Tesla PowerWall-style animated power flow diagrams.

### Features

- 🔄 **Tesla-Style Flow Animation**: Beautiful animated power flow diagram showing real-time consumption
- 💧 **Water Quality Score**: Automatic calculation based on pH, ORP, and temperature
- ⚡ **Multi-Equipment Support**: Pumps, chlorinators, heaters, lights, and more
- 🎨 **Fully Customizable**: Colors, icons, positions, and display options
- 📱 **Responsive Design**: Works perfectly on mobile and desktop
- 💰 **Cost Tracking**: Real-time electricity cost calculation
- 🌊 **Adaptive Animations**: Flow speed adapts to power consumption
- 🎯 **Click for Details**: Tap any equipment for more information

### Supported Equipment

- Filtration pumps
- Salt chlorinators (Hayward, Pentair, etc.)
- Heat pumps
- Pool covers
- pH regulators
- UV systems
- Ozone generators
- Pool lights

### Example Configuration

```yaml
type: custom:lubipool-card
entities:
  panel:
    entity: sensor.pool_total_consumption
    name: Pool System
    quality:
      ph: sensor.pool_ph
      orp: sensor.pool_orp
      temperature: sensor.pool_temperature
  equipment:
    - type: filtration_pump
      entity: sensor.pump_power
      name: Main Pump
      color: '#2196f3'
    - type: salt_chlorinator
      entity: sensor.chlorinator_power
      name: Salt Chlorinator
      color: '#4caf50'
display:
  mode: power
  show_quality_score: true
  show_cost: true
```

### Perfect For

- Hayward AquaRite systems
- Pentair pool systems
- Generic pool automation
- DIY pool monitoring setups
