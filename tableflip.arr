use context essentials2021
include gdrive-sheets
include data-source
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
import math as M
import statistics as S
import lists as L

ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

#loaded table, and sanitized the values
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
end

kWh-wealthy-consumer-data

#Transforming the string values to numeric values
fun energi-to-number(str :: String) -> Number:
  cases (Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
  energi-to-number("") is 0
  energi-to-number("48")is 48
end

#Anvender funksjonen energi-to-number, og viser tabellen med transform
transform-table = transform-column(kWh-wealthy-consumer-data,
  "energi", energi-to-number)
print(transform-table)


#Funksjon for å regne energi for bil per dag, der distance travelled og distance per unit fuel er variabler
fun car-energy-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
  (distance-travelled-per-day / distance-per-unit-of-fuel) *
  energy-per-unit-of-fuel
  
where:
  car-energy-per-day(20, 10, 5) is 10
end

distance-per-day = 20
distance-per-liter = 10
energy-per-unit-of-fuel = 5

#totalsummen av energiforbruk av tabellen
total-energy-per-day =sum(transform-table, "energi") + car-energy-per-day(distance-per-day, distance-per-liter, energy-per-unit-of-fuel)

#Oppdatert tabell
print(total-energy-per-day)

#Lager en tabell for å visualisere energiforbruket
bar-chart(transform-table, "komponent", "energi")


fun energi-to-number-with-car(str :: String) -> Number:
  cases(Option) string-to-number(str):
    |some(a) => a
    | none => car-energy-per-day(20, 10, 5)
  end
where:
  energi-to-number("") is 0
  energi-to-number("48") is 48
end
  
transformed-table-with-car = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)
  print(transformed-table-with-car)
  bar-chart(transformed-table-with-car, "komponent", "energi")