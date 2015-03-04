class ObdWorker

  def self.perform
    obd, err = OBD.connect '/dev/tty.Bluetooth-Incoming-Port', 9600
    if err
      Volt.logger.info err
    else
      OBD::Command.pids.keys.each do |key|
        page._pid.assign_attribute(key.to_sym, obd[key.to_sym])
      end
    end
  end
end
