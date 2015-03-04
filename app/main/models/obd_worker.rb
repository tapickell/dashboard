require 'obd'

class ObdWorker

  def self.perform
    #obd, err = OBD.connect '/dev/tty.Bluetooth-Incoming-Port', 9600
    err = false
    if err
      Volt.logger.info err
    else
      OBD::Command.pids.keys.each_with_object({}) do |key, hash|
        #page._pid.assign_attribute(key.to_sym, obd[key.to_sym])
        hash[key.to_sym] = "Some random value"
      end
    end
  end
end
