include:
  - network.interface-names
  - network.dual-interfaces
  - network.shorewall

netpkgs:
  pkg.installed:
    - names:
      - shorewall

